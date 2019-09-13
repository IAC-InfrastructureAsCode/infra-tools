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

export GOLANG_VERSION=1.13
export goRelArch=amd64
export goRelSha256=68a2297eb099d1a76097905a2ce334e3155004ec08cdea85f24527be3c48e856

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
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | bash