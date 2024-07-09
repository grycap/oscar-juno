sleep 10
export MNT_FOLDER="/mnt/juno/"
export GIT_REPO="SergioLangaritaBenitez/juno"
export OSCAR_REPO="grycap/oscar"
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/00.-setup.ipynb > $MNT_FOLDER/00.-setup.ipynb
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/01.-cowsay.ipynb > $MNT_FOLDER/01.-cowsay.ipynb
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/02.-async.ipynb > $MNT_FOLDER/02.-async.ipynb
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/03.-sync.ipynb > $MNT_FOLDER/03.-sync.ipynb

curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/cowsay.yaml > $MNT_FOLDER/cowsay.yaml
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/body-async.yaml > $MNT_FOLDER/body-async.yaml
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/plant-sync.yaml > $MNT_FOLDER/plant-sync.yaml

curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/script_body_posenet.sh > $MNT_FOLDER/script_body_posenet.sh
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/script_cowsay.sh > $MNT_FOLDER/script_cowsay.sh
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/script_plant.sh > $MNT_FOLDER/script_plant.sh


curl https://raw.githubusercontent.com/$OSCAR_REPO/master/examples/body-pose-detection/images/001.jpg > $MNT_FOLDER/body-pose.jpg
curl https://raw.githubusercontent.com/$OSCAR_REPO/master/examples/plant-classification-sync/images/image1.jpg > $MNT_FOLDER/plant.jpg
start-notebook.sh --NotebookApp.allow_root=True  --Session.username=root  --NotebookApp.base_url=$JHUB_BASE_URL --NotebookApp.token=$JUPYTER_TOKEN  --NotebookApp.notebook_dir=$JUPYTER_DIRECTORY 
