sleep 15

export GIT_REPO="grycap/oscar-juno"
export OSCAR_REPO="grycap/oscar"
JUPYTER_DIRECTORY="${JUPYTER_DIRECTORY:-/mnt/home}"
PERSISTENT_JUPYTER_COOKIE_SECRET_FILE="${PERSISTENT_JUPYTER_COOKIE_SECRET_FILE:-$JUPYTER_DIRECTORY/.jupyter/jupyter_cookie_secret}"
JUPYTER_COOKIE_SECRET_FILE="${JUPYTER_COOKIE_SECRET_FILE:-/tmp/jupyter_cookie_secret}"

mkdir -p "$JUPYTER_DIRECTORY" "$(dirname "$PERSISTENT_JUPYTER_COOKIE_SECRET_FILE")"
export JUPYTER_COOKIE_SECRET_FILE
export PERSISTENT_JUPYTER_COOKIE_SECRET_FILE

python3 - <<'PY'
import os
import shutil
from pathlib import Path

persistent_secret = Path(os.environ["PERSISTENT_JUPYTER_COOKIE_SECRET_FILE"])
runtime_secret = Path(os.environ["JUPYTER_COOKIE_SECRET_FILE"])

persistent_secret.parent.mkdir(parents=True, exist_ok=True)
if not persistent_secret.exists():
    persistent_secret.write_bytes(os.urandom(32))

runtime_secret.parent.mkdir(parents=True, exist_ok=True)
shutil.copyfile(persistent_secret, runtime_secret)
runtime_secret.chmod(0o600)
PY

if [ "$IMAGE_VERSION" != "minimal" ]; then
mkdir -p "$JUPYTER_DIRECTORY/oscar-tutorial"
mkdir -p "$JUPYTER_DIRECTORY/oscar-tutorial/01-sync"
mkdir -p "$JUPYTER_DIRECTORY/oscar-tutorial/01-sync/output"
mkdir -p "$JUPYTER_DIRECTORY/oscar-tutorial/02-async"
mkdir -p "$JUPYTER_DIRECTORY/oscar-tutorial/02-async/img"
mkdir -p "$JUPYTER_DIRECTORY/oscar-tutorial/02-async/output"
mkdir -p "$JUPYTER_DIRECTORY/oscar-tutorial/03-elyra"

curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/tutorial/00-setup.ipynb > $JUPYTER_DIRECTORY/oscar-tutorial/00-setup.ipynb
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/tutorial/01-sync/01-sync.ipynb > $JUPYTER_DIRECTORY/oscar-tutorial/01-sync/01-sync.ipynb
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/tutorial/02-async/02-async.ipynb > $JUPYTER_DIRECTORY/oscar-tutorial/02-async/02-async.ipynb

curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/tutorial/01-sync/cowsay-sync.yaml > $JUPYTER_DIRECTORY/oscar-tutorial/01-sync/cowsay-sync.yaml
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/tutorial/02-async/plant-async.yaml > $JUPYTER_DIRECTORY/oscar-tutorial/02-async/plant-async.yaml

curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/tutorial/01-sync/script_cowsay_sync.sh > $JUPYTER_DIRECTORY/oscar-tutorial/01-sync/script_cowsay_sync.sh
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/tutorial/02-async/script_plant_async.sh > $JUPYTER_DIRECTORY/oscar-tutorial/02-async/script_plant_async.sh

curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/tutorial/02-async/img/plant-input.jpg > $JUPYTER_DIRECTORY/oscar-tutorial/02-async/img/plant-input.jpg
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/tutorial/02-async/img/plant-output.jpg > $JUPYTER_DIRECTORY/oscar-tutorial/02-async/img/plant-output.jpg
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/tutorial/oscar_tutorial.pipeline > $JUPYTER_DIRECTORY/oscar-tutorial/oscar_tutorial.pipeline

curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/tutorial/03-elyra/cowsay.pipeline > $JUPYTER_DIRECTORY/oscar-tutorial/03-elyra/cowsay.pipeline
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/tutorial/03-elyra/setup_client.py > $JUPYTER_DIRECTORY/oscar-tutorial/03-elyra/setup_client.py
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/tutorial/03-elyra/invoke_service_cowsay.ipynb > $JUPYTER_DIRECTORY/oscar-tutorial/03-elyra/invoke_service_cowsay.ipynb

curl https://raw.githubusercontent.com/grycap/apricotlab/main/apricot_tutorial.ipynb > $JUPYTER_DIRECTORY/apricot-tutorial.ipynb
curl https://raw.githubusercontent.com/grycap/apricotlab/main/apricot_magics/apricot_magics.py > $JUPYTER_DIRECTORY/apricot_magics.py
sed -i 's/resources_dir = current_dir.parent \/ "resources"/resources_dir = current_dir \/ "resources"/g' $JUPYTER_DIRECTORY/apricot_magics.py

cp  /apricotlab/resources/ $JUPYTER_DIRECTORY -r
fi

jupyter lab --ServerApp.allow_root=True  --Session.username=root  --ServerApp.base_url=$JHUB_BASE_URL --IdentityProvider.token=$JUPYTER_TOKEN --ServerApp.cookie_secret_file="$JUPYTER_COOKIE_SECRET_FILE" --ServerApp.root_dir=$JUPYTER_DIRECTORY --ip=0.0.0.0 --no-browser 
