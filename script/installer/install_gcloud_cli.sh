#!/usr/bin/env sh

# ================================================================================================
#  INSTALL GCLOUD CLI
# ================================================================================================
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


export GCLOUD_VERSION="251.0.0"
export COMPRESS_FILE="google-cloud-sdk-$GCLOUD_VERSION-linux-x86_64.tar.gz"

cd $HOME
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/$COMPRESS_FILE

tar zxvf $COMPRESS_FILE google-cloud-sdk

cd /$HOME/google-cloud-sdk
bash ./install.sh

### Add this line to last ~/.bashrc ###
#
# The next line updates PATH for the Google Cloud SDK.
# if [ -f $HOME'/google-cloud-sdk/path.bash.inc' ]; then . $HOME'/google-cloud-sdk/path.bash.inc'; fi
#
# The next line enables shell command completion for gcloud.
# if [ -f $HOME'/google-cloud-sdk/completion.bash.inc' ]; then . $HOME'/google-cloud-sdk/completion.bash.inc'; fi
#

### Add this line to last ~/.zshrc ###
#
# The next line updates PATH for the Google Cloud SDK.
# if [ -f $HOME'/google-cloud-sdk/path.zsh.inc' ]; then . $HOME'/google-cloud-sdk/path.zsh.inc'; fi
#
# The next line enables shell command completion for gcloud.
# if [ -f $HOME'/google-cloud-sdk/completion.zsh.inc' ]; then . $HOME'/google-cloud-sdk/completion.zsh.inc'; fi
#
