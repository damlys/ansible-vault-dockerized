FROM ubuntu:eoan

ARG ANSIBLE_VERSION="2.8.3+dfsg-1"
RUN apt-get update && apt-get install --yes --no-install-recommends \
  ansible=${ANSIBLE_VERSION} \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

USER root
WORKDIR /workspace
ENTRYPOINT ["ansible-vault"]
CMD ["--help"]
HEALTHCHECK NONE
