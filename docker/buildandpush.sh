#!/usr/bin/env bash

set -euo pipefail

IMAGE_NAME="${IMAGE_NAME:-ghcr.io/grycap/juno}"
IMAGE_TAG="${1:-latest}"
PLATFORM="${PLATFORM:-linux/amd64,linux/arm64}"
BUILDER_NAME="${BUILDER_NAME:-juno-builder}"
PUSH="${PUSH:-true}"
LOAD="${LOAD:-false}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ensure_builder() {
  if ! docker buildx inspect "${BUILDER_NAME}" >/dev/null 2>&1; then
    docker buildx create --name "${BUILDER_NAME}" --use >/dev/null
  else
    docker buildx use "${BUILDER_NAME}" >/dev/null
  fi
}

register_binfmt() {
  if [[ "${REGISTER_BINFMT:-true}" == "true" ]]; then
    local target="all"
    if [[ "${PLATFORM}" != *","* ]]; then
      target="${PLATFORM#linux/}"
    fi
    if ! docker run --privileged --rm tonistiigi/binfmt --install "${target}" >/dev/null 2>&1; then
      echo "Warning: could not register binfmt; continuing assuming host already supports ${PLATFORM}." >&2
    fi
  fi
}

ensure_builder
register_binfmt

if [[ "${LOAD}" == "true" && "${PLATFORM}" == *","* ]]; then
  echo "Error: --load only supports a single platform. Set PLATFORM to linux/amd64 or linux/arm64." >&2
  exit 1
fi

if [[ "${PUSH}" != "true" && "${LOAD}" != "true" ]]; then
  echo "Warning: neither pushing nor loading the image; the build output will not be stored." >&2
fi

build_cmd=(docker buildx build
  --platform "${PLATFORM}"
  -t "${IMAGE_NAME}:${IMAGE_TAG}"
  "${SCRIPT_DIR}")

if [[ "${PUSH}" == "true" ]]; then
  build_cmd+=(--push)
fi

if [[ "${LOAD}" == "true" ]]; then
  build_cmd+=(--load)
fi
echo "Running: ${build_cmd[*]}"
"${build_cmd[@]}"
