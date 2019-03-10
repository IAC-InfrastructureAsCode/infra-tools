#!/usr/bin/env sh

apt-get update
apt-get install -y \
  git \
  g++ \
  make \
  s3cmd

NODE_VERSION=${node_version:-10.15}

### Path NVM (NodeJS Version Manager) ###
export NVM_ROOT="$HOME/.nvm"

if [ -d "$NVM_ROOT" ]
then
  [ -s "$NVM_ROOT/nvm.sh" ] && . "$NVM_ROOT/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

/bin/bash -c "source ~/.nvm/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && nvm use $NODE_VERSION"
