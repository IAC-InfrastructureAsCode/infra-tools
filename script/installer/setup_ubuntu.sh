#!/usr/bin/env sh

export DEBIAN_FRONTEND=noninteractive

apt-get -qq update
apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install \
  wget \
  curl \
  build-essential \
  zlib1g-dev \
  libssl-dev \
  libreadline-dev \
  libxml2 \
  libxml2-dev \
  libxslt1-dev \
  python-software-properties \
  imagemagick \
  openjdk-8-jre-headless \
  libpng-dev \
  libjpeg-dev \
  libsasl2-dev \
  libmysqlclient-dev \
  phantomjs