FROM ubuntu:18.04
MAINTAINER James Hunt <james@niftylogic.com>

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      curl wget \
      vim-nox nano \
      build-essential \
      iputils-ping iputils-tracepath dnsutils net-tools \
      nmap mtr tcpdump ipgrab tshark iptraf-ng \
      netcat netrw cryptcat \
      rsync \
      git tree unzip \
      tmate tmux \
      htop \
 && rm -rf /var/lib/apt/lists/*

RUN curl -Lo /usr/bin/jq \
      https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 \
 && chmod 0755 /usr/bin/jq

RUN curl -Lo /usr/bin/spruce \
      https://github.com/geofffranks/spruce/releases/download/v1.19.1/spruce-linux-amd64 \
 && chmod 0755 /usr/bin/spruce

RUN curl -Lo /usr/bin/safe \
      https://github.com/starkandwayne/safe/releases/download/v0.9.9/safe-linux-amd64 \
 && chmod 0755 /usr/bin/safe

RUN curl -Lo /tmp/vault.zip \
      https://releases.hashicorp.com/vault/1.0.1/vault_1.0.1_linux_amd64.zip \
 && cd /usr/local \
 && unzip -qu /tmp/vault.zip \
 && rm /tmp/vault.zip

RUN curl -Lo /usr/bin/bosh \
      https://github.com/cloudfoundry/bosh-cli/releases/download/v5.4.0/bosh-cli-5.4.0-linux-amd64 \
 && chmod 0755 /usr/bin/bosh

RUN cd /usr/bin \
 && curl -L 'https://cli.run.pivotal.io/stable?release=linux64-binary&source=github' | tar -zx cf \
 && chown 0755 /usr/bin/cf

RUN curl -Lo /usr/bin/botherhub \
      https://raw.githubusercontent.com/jhunt/botherhub/master/botherhub \
 && chmod 0755 /usr/bin/botherhub

RUN curl -Lo /usr/bin/s3 \
      https://github.com/jhunt/s3/releases/download/v0.2.5/s3-darwin-amd64 \
 && chmod 0755 /usr/bin/s3

RUN curl -Lo /usr/bin/osb \
      https://github.com/jhunt/osb/releases/download/v0.1.1/osb-darwin-amd64 \
 && chmod 0755 /usr/bin/osb

RUN curl -Lo /usr/bin/boss \
      https://github.com/jhunt/boss/releases/download/v0.0.3/boss-linux-amd64 \
 && chmod 0755 /usr/bin/boss

RUN curl -Lo /usr/bin/gotcha \
      https://github.com/starkandwayne/gotcha/releases/download/0.2.0/gotcha-darwin-amd64 \
 && chmod 0755 /usr/bin/gotcha

RUN curl -Lo /usr/bin/shield \
      https://github.com/starkandwayne/shield/releases/download/8.0.17/shield-darwin-amd64 \
 && chmod 0755 /usr/bin/shield

CMD ["/bin/bash"]
