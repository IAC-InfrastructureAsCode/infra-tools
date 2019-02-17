## **Infra Tools**

Collection sets of tools for provision & deployment instances, vm & container.

### **Features**
* Ansible
* DocKube
* HelmCharts
* Kubespray (K8S Deployment)
* Nomad
* Packer
* Portainer (Docker UI Tools)
* Terragrunt (Terraform Wrapper)

### **How To Run Ansible**
* Setup `remote_user` in `ansible/ansible.cfg`

```
remote_user=root  # root / ubuntu
```

* Deploy Ansible Playbook

```
ansible-playbook -i datacenter/{{ datacenter_name }}/inventory.ini deploy/{{ playbook_name }}.yml --limit "{{ ip-1,ip-2,ip-n }}"
-----
ansible-playbook -i datacenter/dockube/inventory.ini playbook/_dockube/dockube-nsq.yml --limit "172.212.0.6"
ansible-playbook -i datacenter/dockube/inventory.ini playbook/_dockube/dockube-golang.yml
```

### **How To Run DocKube**
* Setup Environment

```
cp .env.example .env
```

* Customize your own environment `.env`
* Copy your public-key (`id_rsa.pub`) to each `ssh-key` in dockube folder.
* Setup your own environment DocKube deployment in `dockube-build.sh` file.

```
ENV="0"                    # container environment (0 = development, 1 = staging, 2 = production)
SKIP_BUILD="0"             # (0 = with build process, 1 = bypass build process)
REMOVE_CACHE="0"           # (0 = using cache, 1 = no-cache)
RECREATE_CONTAINER="0"     # (0 = disable recreate container, 1 = force recreate container)
DAEMON_MODE="1"            # (0 = disable daemon mode, 1 = running daemon mode / background)

USERNAME=`echo $USER`
PATH_HOME=`echo $HOME`

CONTAINER_PRODUCTION="portainer dockube-master dockube-node dockube-nfs"
CONTAINER_STAGING="portainer dockube-master dockube-node dockube-nfs"
CONTAINER_DEVELOPMENT="portainer dockube-master dockube-node dockube-nfs"
```

* Running **DocKube** Services:

```
make [services]:
  - dockube-run:    Running Container DocKube
  - compose-build:  Build spesific container services
  - compose-up:     Start all container
  - dockube-stop:   Stop all container DocKube
  - dockube-down:   Delete all container DocKube
```

### **How To Run Kubespray**
* Copy your public-key (`id_rsa.pub`) to each `ssh-key` in dockube folder.
* Clone Repository `Kubespray` from our repo [`dockube/kubespray`](https://github.com/dockube/kubespray).

```
Go to `workspace` folder clone `kubespray` from
`https://github.com/dockube/kubespray`
-----
$ cd workspace
$ git clone https://github.com/dockube/kubespray
```

* Configure `kubespray/ansible.cfg`:

```
### Baremetal / AWS / GCP ###
#remote_user=ubuntu

### OpenStack / DigitalOcean (DO) / DocKube ###
remote_user=root
```

* Setup your own environment kubespray deployment in `workspace/kubespray/kubespray.sh` file.

```
ENV_KEY="0"                # Setup environment key private (0 = Not Used, 1 = DocKube, 2 = Staging, 3 = Production)
VERBOSE_MODE="0"           # (0 = disable verbose mode, 1 = running verbose mode)
VERBOSE_COMMAND="-vvv"

INVENTORY_DOCKUBE="inventory/dockube/hosts.ini"
INVENTORY_STAGING="inventory/k8s-staging/hosts.ini"
INVENTORY_PRODUCTION="inventory/k8s-production/hosts.ini"

DOCKUBE_PATH_KEY="/opt/keyserver/key-dockube.pem"
STAGING_PATH_KEY="/opt/keyserver/key-staging.pem"
PRODUCTION_PATH_KEY="/opt/keyserver/key-prod.pem"
```

* Running **Kubespray** Services:

```
make [services]:
  - dockube-cluster:      Build K8S cluster in DocKube environment
  - dockube-remove:       Remove K8S cluster in DocKube environment
  - dockube-reset:        Reset all configuration K8S cluster in DocKube environment
  - dockube-scale:        Scale new K8S cluster in DocKube environment
  - dockube-upgrade:      Upgrade K8S cluster in DocKube environment

  - staging-cluster:      Build K8S cluster in Staging environment
  - staging-remove:       Remove K8S cluster in Staging environment
  - staging-reset:        Reset all configuration K8S cluster in Staging environment
  - staging-scale:        Scale new K8S cluster in Staging environment
  - staging-upgrade:      Upgrade K8S cluster in Staging environment

  - production-cluster:   Build K8S cluster in Production environment
  - production-remove:    Remove K8S cluster in Production environment
  - production-reset:     Reset all configuration K8S cluster in Production environment
  - production-scale:     Scale new K8S cluster in Production environment
  - production-upgrade:   Upgrade K8S cluster in Production environment
```

### **SSH Docker Container**
* Copy your public-key (id_rsa.pub) to each `ssh-key` folder.
* Check Container Running

```
docker ps
```

* Inspect IP Address

```
docker inspect [container_id]
-----
docker inspect 1486 | grep IP    # container_id: dockube-master
"IPAddress": "172.212.0.6"
```

* Use `root` account

```
ssh root@172.212.0.12
```

* Check Container

```
root@1486b2a592b3:~# go version
go version go1.11.1 linux/amd64

root@1486b2a592b3:~# ansible --version
ansible 2.0.0.2
config file = /etc/ansible/ansible.cfg
configured module search path = Default w/o overrides
```
