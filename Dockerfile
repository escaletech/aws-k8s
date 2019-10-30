FROM cimg/base:stable

# Installs envsubst
RUN \
  apt-get update \
  && apt-get -y install gettext-base

# Installs aws-cli
RUN \
  apt-get install -y python-pip python-dev && \
  pip install --upgrade awscli

# Installs kubernetes
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
	chmod +x ./kubectl && \
	mv ./kubectl /usr/local/bin

COPY ./scripts /scripts
