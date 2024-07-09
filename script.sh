sleep 10
export MNT_FOLDER="/mnt/juno/"
export GIT_REPO="SergioLangaritaBenitez/juno"
export OSCAR_REPO="grycap/oscar"
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/01.-cowsay.ipynb > $MNT_FOLDER/01.-cowsay.ipynb
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/02.-async.ipynb > $MNT_FOLDER/02.-async.ipynb
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/03.-sync.ipynb > $MNT_FOLDER/03.-sync.ipynb
curl https://raw.githubusercontent.com/$OSCAR_REPO/master/examples/cowsay/cowsay.yaml > $MNT_FOLDER/examples/cowsay/cowsay.yaml
curl https://raw.githubusercontent.com/$OSCAR_REPO/master/examples/cowsay/script.sh > $MNT_FOLDER/examples/cowsay/script.sh
start-notebook.sh --NotebookApp.allow_root=True  --Session.username=root  --NotebookApp.base_url=$JHUB_BASE_URL --NotebookApp.token=$JUPYTER_TOKEN  --NotebookApp.notebook_dir=$JUPYTER_DIRECTORY 
