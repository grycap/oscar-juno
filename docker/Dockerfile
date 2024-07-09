FROM jupyter/minimal-notebook

USER root

RUN apt-get update
RUN curl https://codeload.github.com/indigo-dc/oidc-agent/zip/refs/tags/v5.0.0 --output oidc-agent.zip

RUN unzip oidc-agent.zip 

RUN sudo apt-get install -y \
      libcurl4-openssl-dev \
      libsodium-dev \
      libmicrohttpd-dev \
      libsecret-1-dev \
      libqrencode-dev \
      libwebkit2gtk-4.0-dev 

RUN apt-get install -y build-essential
RUN apt install -y libcjson1 libcjson-dev jq

RUN make --directory=/home/jovyan/oidc-agent-5.0.0 install_bin
RUN make --directory=/home/jovyan/oidc-agent-5.0.0 install_conf
RUN make --directory=/home/jovyan/oidc-agent-5.0.0 install_bash
RUN make --directory=/home/jovyan/oidc-agent-5.0.0 install_scheme_handler
RUN make --directory=/home/jovyan/oidc-agent-5.0.0 install_xsession_script
RUN make --directory=/home/jovyan/oidc-agent-5.0.0 install_lib
RUN make --directory=/home/jovyan/oidc-agent-5.0.0 install_lib-dev

COPY --chmod=0700 setupscript.sh /home/jovyan/setupscript.sh
