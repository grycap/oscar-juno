#FROM jupyter/minimal-notebook
FROM ghcr.io/grycap/im

#USER root

ARG OIDC_FOLDER="" 
ENV OIDC_SOCK=/tmp/oidc-agent-service-0/oidc-agent.sock

RUN apt-get update -y && \
    apt-get upgrade -y pip && \
    python3 -m pip config set global.break-system-packages true

RUN pip install IM-client jupyter==1.0.0
RUN echo "deb http://gb.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list 
RUN apt update && apt install -y libgtk-3-0t64 shared-mime-info shared-mime-info libgtk-3-0t64 xdg-desktop-portal-gtk
 
RUN apt install -y libwebkit2gtk-4.0-dev
RUN apt-get install -y \
      curl git unzip make nodejs \
      build-essential libcjson1 libcjson-dev jq \
      libcurl4-openssl-dev \
      libsodium-dev \
      libmicrohttpd-dev \
      libsecret-1-dev \
      libqrencode-dev

RUN curl -L https://codeload.github.com/indigo-dc/oidc-agent/zip/refs/tags/v5.0.0 -o oidc-agent.zip && \
    unzip oidc-agent.zip && rm oidc-agent.zip

RUN make -C $OIDC_FOLDER/oidc-agent-5.0.0 install_bin && \
    make -C $OIDC_FOLDER/oidc-agent-5.0.0 install_conf && \
    make -C $OIDC_FOLDER/oidc-agent-5.0.0 install_bash && \
    make -C $OIDC_FOLDER/oidc-agent-5.0.0 install_scheme_handler && \
    make -C $OIDC_FOLDER/oidc-agent-5.0.0 install_xsession_script && \
    make -C $OIDC_FOLDER/oidc-agent-5.0.0 install_lib && \
    make -C $OIDC_FOLDER/oidc-agent-5.0.0 install_lib-dev

RUN pip install oscar-python==1.3.1 liboidcagent
RUN pip install --upgrade "elyra[all]"

COPY --chmod=0700 setupscript.sh $OIDC_FOLDER/setupscript.sh
COPY --chmod=0700 apricotlab $OIDC_FOLDER/apricotlab

RUN sed -i "s|realpath --relative-to=\"\$(pwd)\" resources/infrastructuresList.json|realpath --relative-to=\$JUPYTER_DIRECTORY \$JUPYTER_DIRECTORY/resources/infrastructuresList.json|g" $OIDC_FOLDER/apricotlab/src/utils.ts && \
    sed -i "s|realpath --relative-to=\"\$(pwd)\" resources/deployed-template.yaml|realpath --relative-to=\$JUPYTER_DIRECTORY \$JUPYTER_DIRECTORY/resources/deployed-template.yaml|g" $OIDC_FOLDER/apricotlab/src/utils.ts && \
    sed -i "s|realpath --relative-to=\"\$(pwd)\" resources/deployable_templates|realpath --relative-to=\$JUPYTER_DIRECTORY \$JUPYTER_DIRECTORY/resources/deployable_templates|g" $OIDC_FOLDER/apricotlab/src/utils.ts

RUN pip install -ve $OIDC_FOLDER/apricotlab && \
    jupyter labextension develop --overwrite $OIDC_FOLDER/apricotlab

ENTRYPOINT [ "jupyter", "lab", "--allow-root","--ip=0.0.0.0", "--no-browser" ]