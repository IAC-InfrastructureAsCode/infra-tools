#!/usr/bin/env sh

# ================================================================================================
#  INSTALL ALIYUN CLI
# ================================================================================================
export DEBIAN_FRONTEND=noninteractive

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

export BIN_GO=`which go`
if [ ! -f "$BIN_GO" ]; then
  bash ./install_golang.sh
fi

export ALIYUN_SRC="$GOPATH/src/github.com/aliyun"
git clone git@github.com:aliyun/aliyun-openapi-meta.git "$ALIYUN_SRC/aliyun-openapi-meta"
git clone git@github.com:aliyun/aliyun-cli.git "$ALIYUN_SRC/aliyun-cli"
cd "$ALIYUN_SRC/aliyun-cli"

#export BIN_DEP=`which dep`
#$BIN_DEP ensure -v
#go build main/main.go

### Dep Manager ###
make deps
make clean
go build main/main.go
