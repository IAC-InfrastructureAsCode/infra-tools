#!/usr/bin/env sh

# ================================================================================================
#  INSTALL GCLOUD CLI
# ================================================================================================
apt-get update
apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install \
  git \
  bash \
  curl \
  wget \
  zip \
  unzip \
  software-properties-common \
  openssh-server \
  openssh-client


export GCLOUD_VERSION="240.0.0"
export COMPRESS_FILE="google-cloud-sdk-$GCLOUD_VERSION-linux-x86_64.tar.gz"

cd /tmp
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/$COMPRESS_FILE

tar zxvf $COMPRESS_FILE google-cloud-sdk

cd /tmp/google-cloud-sdk
bash ./install.sh
