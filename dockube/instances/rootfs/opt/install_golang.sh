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

export GOLANG_VERSION=${GOLANG_VERSION:-1.11.1}
export goRelArch=amd64
export goRelSha256=2871270d8ff0c8c69f161aaae42f9f28739855ff5c5204752a8d92a1c9f63993

set -eux;

url="https://storage.googleapis.com/golang/go$GOLANG_VERSION.linux-$goRelArch.tar.gz";
curl -O $url
tar -xvf go$GOLANG_VERSION.linux-$goRelArch.tar.gz
cp -r go /usr/local

rm -rf /go
rm -f go$GOLANG_VERSION.linux-$goRelArch.tar.gz

mkdir -p $HOME/go

echo 'export GOPATH=$HOME/go' >> ~/.profile
echo 'export GOROOT=/usr/local/go' >> ~/.profile
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.profile

# source ~/.profile
