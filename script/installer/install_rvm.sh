#!/usr/bin/env sh

# ================================================================================================
#  INSTALL RVM (Ruby Version Manager)
# ================================================================================================
export DEBIAN_FRONTEND=noninteractive

export RVM_VERSION="1.29.9"
export RUBY_VERSION="2.6.3"
export RUBY_VERSION_SHASUM="577fd3795f22b8d91c1d4e6733637b0394d4082db659fccf224c774a2b1c82fb"

if ! [ "${RB_VERSION}" = "" ]
then
  RUBY_VERSION=${RB_VERSION}
fi

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

##### CUSTOMIZE ~/.profile #####
echo '' >> ~/.profile
echo '### Path Ruby RBENV / RVM ###
export RBENV_ROOT="$HOME/.rbenv"
export RVM_ROOT="$HOME/.rvm"

### rbenv (Ruby) default ###
if [ -d "$RBENV_ROOT" ]
then
  export PATH="$RBENV_ROOT/bin:${PATH}"
  eval "$(rbenv init -)"
  export PATH="$RBENV_ROOT/plugins/ruby-build/bin:$PATH"
  # export RAILS_ENV=staging
else
  ### rvm (Ruby) - alternative ###
  if [ -d "$RVM_ROOT" ]
  then
    export PATH="$PATH:$RVM_ROOT/bin"
    source $RVM_ROOT/scripts/rvm

    # Set PATH alternatives using this:
    [[ -s "$RVM_ROOT/scripts/rvm"  ]] && source "$RVM_ROOT/scripts/rvm"
  fi
fi' >> ~/.profile

# reload source ~/.profile
/bin/bash -c "source ~/.profile"

##### INSTALL RVM #####
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

rvm install ${RUBY_VERSION}
rvm use ${RUBY_VERSION} --default