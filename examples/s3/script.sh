sleep 15
export GIT_REPO="grycap/oscar-juno"
export OSCAR_REPO="grycap/oscar"
mkdir -p $JUPYTER_DIRECTORY
mkdir $JUPYTER_DIRECTORY/oscar-tutorial
mkdir $JUPYTER_DIRECTORY/oscar-tutorial/01-sync
mkdir $JUPYTER_DIRECTORY/oscar-tutorial/01-sync/output
mkdir $JUPYTER_DIRECTORY/oscar-tutorial/02-async
mkdir $JUPYTER_DIRECTORY/oscar-tutorial/02-async/img
mkdir $JUPYTER_DIRECTORY/oscar-tutorial/02-async/output

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

curl https://raw.githubusercontent.com/grycap/apricotlab/main/apricot_tutorial.ipynb > $JUPYTER_DIRECTORY/apricot-tutorial.ipynb
curl https://raw.githubusercontent.com/grycap/apricotlab/main/apricot_magics/apricot_magics.py > $JUPYTER_DIRECTORY/apricot_magics.py
sed -i 's/resources_dir = current_dir.parent \/ "resources"/resources_dir = current_dir \/ "resources"/g' $JUPYTER_DIRECTORY/apricot_magics.py

cp  /apricotlab/resources/ $JUPYTER_DIRECTORY -r

jupyter lab --ServerApp.allow_root=True  --Session.username=root  --ServerApp.base_url=$JHUB_BASE_URL --IdentityProvider.token=$JUPYTER_TOKEN  --ServerApp.root_dir=$JUPYTER_DIRECTORY --ip=0.0.0.0 --no-browser 
