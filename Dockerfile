FROM ubuntu:bionic

ARG ANSIBLE_VERSION="2.5.1+dfsg-1ubuntu0.1"
RUN apt-get update && apt-get install --yes --no-install-recommends \
  ansible=${ANSIBLE_VERSION} \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

USER root
WORKDIR /workspace
ENTRYPOINT ["ansible-vault"]
CMD ["--help"]
HEALTHCHECK NONE
