#!/usr/bin/env sh

##### STOP DOCKER SERVICE (if exist) #####
# ps aux | grep -i docker | awk {'print $2'} | sudo xargs kill -9

# ================================================================================================
#  INSTALL DOCKER
# ================================================================================================
export DEBIAN_FRONTEND=noninteractive
export DOCKER_PATH="/usr/bin/docker"
export DOCKER_COMPOSE_PATH="/usr/local/bin/docker-compose"
export DOCKER_COMPOSE_VERSION="1.24.1"
export USER_NAME=`echo $USER`

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get update
apt-cache policy docker-ce

apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install \
    docker-ce
# systemctl status docker

# ================================================================================================
#  INSTALL DOCKER-COMPOSE
# ================================================================================================
curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -o $DOCKER_COMPOSE_PATH

chmod +x /usr/local/bin/docker-compose

##### CONFIGURE DOCKER #####
usermod -aG docker $USER_NAME

ln -snf $DOCKER_PATH /usr/local/bin/dock
ln -snf $DOCKER_COMPOSE_PATH /usr/local/bin/dockc
