#!/usr/bin/env bash
#
# git wrapper that appends --separate-git-dir and trims first directory of clone path
#

REAL_GIT_BIN="/usr/bin/git"

if [[ "$1" == "clone" ]]; then
    shift
    repo_url=""
    target_dir=""

    # Parse arguments
    for arg in "$@"; do
        if [[ ! "$arg" =~ ^- && -z "$repo_url" ]]; then
            repo_url="$arg"
        elif [[ ! "$arg" =~ ^- ]]; then
            target_dir="$arg"
        fi
    done

    # If no target dir specified, infer it
    if [[ -z "$target_dir" && -n "$repo_url" ]]; then
        target_dir="$(basename "$repo_url" .git)"
    fi

    # Get absolute path of target
    abs_target=$(realpath "$target_dir" 2>/dev/null || echo "$target_dir")

    # Strip first directory from absolute path
    stripped="/${abs_target#/*/}"

    # Build separate git dir path
    separate_dir="$HOME/.gitdirs${stripped}.git"
    mkdir -p "$(dirname "$separate_dir")"

    # Clone and append the flag at the end
    exec "$REAL_GIT_BIN" clone "$@" --separate-git-dir="$separate_dir"
else
    exec "$REAL_GIT_BIN" "$@"
fi
