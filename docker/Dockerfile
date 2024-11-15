#FROM jupyter/minimal-notebook
FROM ghcr.io/grycap/im


#USER root


ARG OIDC_FOLDER=""
ENV OIDC_SOCK=/tmp/oidc-agent-service-0/oidc-agent.sock


RUN apt-get update -y \
    && apt-get upgrade -y pip \
    && pip install --upgrade pip 


RUN pip install IM-client jupyter==1.0.0

RUN apt-get install -y \
      curl git unzip make nodejs \
      build-essential libcjson1 libcjson-dev jq \
      libcurl4-openssl-dev \
      libsodium-dev \
      libmicrohttpd-dev \
      libsecret-1-dev \
      libqrencode-dev \
      libwebkit2gtk-4.0-dev 


RUN curl https://codeload.github.com/indigo-dc/oidc-agent/zip/refs/tags/v5.0.0 --output oidc-agent.zip

RUN unzip oidc-agent.zip 


RUN make --directory=$OIDC_FOLDER/oidc-agent-5.0.0 install_bin
RUN make --directory=$OIDC_FOLDER/oidc-agent-5.0.0 install_conf
RUN make --directory=$OIDC_FOLDER/oidc-agent-5.0.0 install_bash
RUN make --directory=$OIDC_FOLDER/oidc-agent-5.0.0 install_scheme_handler
RUN make --directory=$OIDC_FOLDER/oidc-agent-5.0.0 install_xsession_script
RUN make --directory=$OIDC_FOLDER/oidc-agent-5.0.0 install_lib
RUN make --directory=$OIDC_FOLDER/oidc-agent-5.0.0 install_lib-dev

RUN pip install oscar-python liboidcagent
RUN pip install --upgrade "elyra[all]"
ENV  OIDC_SOCK=/tmp/oidc-agent-service-0/oidc-agent.sock
COPY --chmod=0700 setupscript.sh $OIDC_FOLDER/setupscript.sh

COPY --chmod=0700 apricotlab $OIDC_FOLDER/apricotlab

RUN sed -i 's/realpath --relative-to="$(pwd)" resources\/infrastructuresList.json/ realpath --relative-to="$JUPYTER_DIRECTORY" $JUPYTER_DIRECTORY\/resources\/infrastructuresList.json/g' $OIDC_FOLDER/apricotlab/src/utils.ts
RUN sed -i 's/realpath --relative-to="$(pwd)" resources\/deployed-template.yaml/ realpath --relative-to="$JUPYTER_DIRECTORY" $JUPYTER_DIRECTORY\/resources\/deployed-template.yaml/g' $OIDC_FOLDER/apricotlab/src/utils.ts
RUN sed -i 's/realpath --relative-to="$(pwd)" resources\/deployable_templates/ realpath --relative-to="$JUPYTER_DIRECTORY" $JUPYTER_DIRECTORY\/resources\/deployable_templates/g' $OIDC_FOLDER/apricotlab/src/utils.ts

RUN pip install backports.tarfile
RUN pip install  -ve $OIDC_FOLDER/apricotlab 
RUN jupyter labextension develop --overwrite $OIDC_FOLDER/apricotlab

ENTRYPOINT [ "jupyter", "lab", "--allow-root","--ip=0.0.0.0", "--no-browser" ]


