sleep 10
export GIT_REPO="grycap/oscar-juno"
export OSCAR_REPO="grycap/oscar"
mkdir -p $JUPYTER_DIRECTORY
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/00.-setup.ipynb > $JUPYTER_DIRECTORY/00.-setup.ipynb
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/01.-cowsay.ipynb > $JUPYTER_DIRECTORY/01.-cowsay.ipynb
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/02.-async.ipynb > $JUPYTER_DIRECTORY/02.-async.ipynb
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/03.-sync.ipynb > $JUPYTER_DIRECTORY/03.-sync.ipynb
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/04.-resetOSCAR.ipynb > $JUPYTER_DIRECTORY/04.-resetOSCAR.ipynb

curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/cowsay.yaml > $JUPYTER_DIRECTORY/cowsay.yaml
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/body-async.yaml > $JUPYTER_DIRECTORY/body-async.yaml
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/plant-sync.yaml > $JUPYTER_DIRECTORY/plant-sync.yaml

curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/script_body_posenet.sh > $JUPYTER_DIRECTORY/script_body_posenet.sh
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/script_cowsay.sh > $JUPYTER_DIRECTORY/script_cowsay.sh
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/script_plant.sh > $JUPYTER_DIRECTORY/script_plant.sh


curl https://raw.githubusercontent.com/$OSCAR_REPO/master/examples/body-pose-detection/images/001.jpg > $JUPYTER_DIRECTORY/body-pose.jpg
curl https://raw.githubusercontent.com/$OSCAR_REPO/master/examples/plant-classification-sync/images/image1.jpg > $JUPYTER_DIRECTORY/plant.jpg
curl https://raw.githubusercontent.com/$GIT_REPO/master/examples/oscar_tutorial.pipeline > $JUPYTER_DIRECTORY/oscar_tutorial.pipeline

#curl https://raw.githubusercontent.com/grycap/apricotlab/main/apricot-tutorial.ipynb > $JUPYTER_DIRECTORY/apricot-tutorial.ipynb
#curl https://raw.githubusercontent.com/grycap/apricotlab/main/src/apricot_magics.py > $JUPYTER_DIRECTORY/apricot_magics.py


#git clone https://github.com/grycap/apricotlab $JUPYTER_DIRECTORY/apricotlab
#mv /apricotlab $JUPYTER_DIRECTORY/apricotlab
#jlpm install
#pip install backports.tarfile
#pip install  -ve $JUPYTER_DIRECTORY/apricotlab 
#jupyter labextension develop --overwrite $JUPYTER_DIRECTORY/apricotlab

#cp  /apricotlab/resources/ $JUPYTER_DIRECTORY -r

#cp /apricotlab $JUPYTER_DIRECTORY -r
#python3 -m pip install --upgrade pip
#pip install backports.tarfile
#pip install  -ve $JUPYTER_DIRECTORY/apricotlab 
#jupyter labextension develop --overwrite $JUPYTER_DIRECTORY/apricotlab


jlpm run build
jupyter lab --ServerApp.allow_root=True  --Session.username=root  --ServerApp.base_url=$JHUB_BASE_URL --IdentityProvider.token=$JUPYTER_TOKEN  --ServerApp.root_dir=$JUPYTER_DIRECTORY --ip=0.0.0.0 --no-browser 
#start-notebook.sh --ServerApp.allow_root=True  --Session.username=root  --ServerApp.base_url=$JHUB_BASE_URL --IdentityProvider.token=$JUPYTER_TOKEN  --ServerApp.root_dir=$JUPYTER_DIRECTORY 
