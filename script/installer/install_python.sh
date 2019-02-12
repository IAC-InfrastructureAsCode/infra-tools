#!/usr/bin/env sh

# ================================================================================================
#  INSTALL PYTHON
# ================================================================================================
export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install \
    git \
    bash \
    curl \
    wget \
    software-properties-common \
    openssh-server \
    openssh-client \
    zip \
    unzip \
    net-tools \
    vim-tiny \
    nano

for key in /etc/ssh/ssh_host_*_key.pub; do echo "localhost $(cat ${key})" >> /root/.ssh/known_hosts; done

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
  && python get-pip.py \
  && pip install coverage junit-xml

rm -f get-pip.py

# ================================================================================================
#  INSTALL PYTHON DEPENDENCIES
# ================================================================================================
pip install -U "setuptools==3.4.1"
pip install -U "pip==1.5.4"
pip install -U "Mercurial==2.9.1"
pip install -U "virtualenv==1.11.4"
