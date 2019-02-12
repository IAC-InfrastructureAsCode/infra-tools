ARG UBUNTU_VERSION=18.04
FROM ubuntu:${UBUNTU_VERSION}

# ================================================================================================
#  Inspiration: Docker Framework (https://github.com/dockube/dockube)
#               Dwi Fahni Denni <zeroc0d3.team@gmail.com>
# ================================================================================================

MAINTAINER "ZeroC0D3 Team <zeroc0d3.team@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update; sync
RUN apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install \
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

COPY rootfs/ /

# ================================================================================================
#  INSTALL SSH
# ================================================================================================
#-----------------------------------------------------------------------------
# Change 'root' Password
#-----------------------------------------------------------------------------
# RUN echo 'root:'${SSH_ROOT_PASSWORD} | chpasswd
RUN echo 'root:root' | chpasswd; sync

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#-----------------------------------------------------------------------------
# Generate Public Key
#-----------------------------------------------------------------------------
# Create new public key
RUN /usr/bin/ssh-keygen -t rsa -b 4096 -C "k8s@dockube.local" -f $HOME/.ssh/id_rsa -q -N ""; sync

RUN mkdir -p $HOME/.ssh \
    && touch $HOME/.ssh/authorized_keys \
    && chmod 700 $HOME/.ssh \
    && chmod go-w $HOME $HOME/.ssh \
    && chmod 600 $HOME/.ssh/authorized_keys \
    && chown `whoami` $HOME/.ssh/authorized_keys \
    && cat $HOME/.ssh/id_rsa.pub > $HOME/.ssh/authorized_keys

# Create new pem file from public key
RUN /usr/bin/ssh-keygen -f $HOME/.ssh/id_rsa.pub -e -m pem > $HOME/.ssh/id_rsa.pem

# Create new public key for host
RUN /usr/bin/ssh-keygen -A; sync

COPY ./ssh-key/id_rsa.pub /tmp/ownkey.pub
RUN cat /tmp/ownkey.pub >> $HOME/.ssh/authorized_keys

CMD ["/usr/sbin/sshd", "-D"]

# ================================================================================================
#  INSTALL GOLANG
# ================================================================================================
USER root
ARG INSTALL_GOLANG=false
RUN if [ "${INSTALL_GOLANG}" = true ]; then \
      /bin/sh /opt/install_golang.sh \
    ;fi

ENV GOPATH=$HOME/go
ENV GOROOT=/usr/local/go
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin
RUN mkdir -p "${GOPATH}/src" "${GOPATH}/bin" && chmod -R 777 "${GOPATH}"

# ================================================================================================
#  INSTALL NFS (CLIENT)
# ================================================================================================
RUN apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install \
	mc \
      nfs-common

RUN mkdir -p /data-node

# ================================================================================================
#  CLEAN UP INSTALLATION
# ================================================================================================
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/init"]
EXPOSE 22 22/tcp
EXPOSE 2379 2379/tcp
EXPOSE 6443 6443/tcp
EXPOSE 10251 10251/tcp
