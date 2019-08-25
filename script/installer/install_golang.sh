#!/usr/bin/env sh

# ================================================================================================
#  INSTALL GOLANG
# ================================================================================================
export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install --no-install-recommends \
	g++ \
	gcc \
	libc6-dev \
	make \
	pkg-config

export GOLANG_VERSION=1.12.1
export goRelArch=amd64
export goRelSha256=2871270d8ff0c8c69f161aaae42f9f28739855ff5c5204752a8d92a1c9f63993

if ! [ "${GO_VERSION}" = "" ]
then
  GOLANG_VERSION=${GO_VERSION}
fi

set -eux;

url="https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-${goRelArch}.tar.gz";
curl -O $url
tar -xvf go${GOLANG_VERSION}.linux-${goRelArch}.tar.gz
cp -r go /usr/local

rm -rf /go
rm -f go${GOLANG_VERSION}.linux-${goRelArch}.tar.gz

mkdir -p $HOME/go

##### CUSTOMIZE ~/.profile #####
echo '' >> ~/.profile
echo '### GO-Lang $GOPATH ###
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.profile

# reload source ~/.profile
/bin/bash -c "source ~/.profile"

### Install Dep (Golang Package Manager) ###
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
