#!/usr/bin/env sh

export DEBIAN_FRONTEND=noninteractive
export BEANSTALKD_VERSION=1.11

apt-get update
apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install \
  curl \
  build-essential \
  software-properties-common \
  wget \
  zip \
  unzip

curl -sL https://github.com/kr/beanstalkd/archive/v${BEANSTALKD_VERSION}.tar.gz | tar xvz -C /tmp

cd /tmp/beanstalkd-${BEANSTALKD_VERSION}
make
cp beanstalkd /usr/bin

apt-get remove --purge -y curl \
  build-essential \
  software-properties-common \
  wget \
  zip \
  unzip \
  && apt-get autoclean \
  && apt-get clean

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
