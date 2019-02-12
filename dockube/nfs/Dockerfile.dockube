ARG UBUNTU_VERSION=18.04
FROM dockube/dockube-nfs:${UBUNTU_VERSION}

# ================================================================================================
#  Inspiration: Docker Framework (https://github.com/dockube/dockube)
#               Dwi Fahni Denni <zeroc0d3.team@gmail.com>
# ================================================================================================

MAINTAINER "ZeroC0D3 Team <zeroc0d3.team@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

COPY rootfs/ /

# ================================================================================================
#  INSTALL SSH
# ================================================================================================
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
#  INSTALL NFS (SERVER)
# ================================================================================================
RUN apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install \
	mc \
      nfs-kernel-server

RUN mkdir -p /data

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
