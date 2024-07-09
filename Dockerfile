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
RUN make --directory=oidc-agent-5.0.0

#RUN apt install -y oidc-agent-cli
#RUN rm -rf /tmp/oidc-agent-service/${UID}/
#RUN ln -s /tmp/oidc-agent-service-${UID} /tmp/oidc-agent-service/${UID}

#RUN eval `oidc-agent-service use`
#RUN eval `oidc-agent-service restart`
#RUN oidc-gen -u juno

