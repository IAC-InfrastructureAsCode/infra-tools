# -----------------------------------------------------------------------------
#  MAKEFILE RUNNING COMMAND
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni (@zeroc0d3)
#  Repository : https://github.com/dockube/dockube
#  License    : Apache v2
# -----------------------------------------------------------------------------
# Notes:
# use [TAB] instead [SPACE]

PATH_KUBESPRAY="./workspace/kubespray"
PATH_TERRAGRUNT="./terragrunt"

#------------------------
# DocKube Services
#------------------------
dockube-run:
	./dockube-cmd.sh build

compose-build:
	./dockube-cmd.sh compose-build $1

compose-up:
	./dockube-cmd.sh compose-up

dockube-stop:
	./dockube-cmd.sh compose-stop

dockube-down:
	./dockube-cmd.sh compose-down

#------------------------
# Kubespray Services
#------------------------
dockube-cluster:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh dockube-cluster

dockube-remove:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh dockube-remove

dockube-reset:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh dockube-reset

dockube-scale:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh dockube-scale

dockube-upgrade:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh dockube-upgrade

#------------------------
staging-cluster:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh k8s-staging-cluster

staging-remove:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh k8s-staging-remove

staging-reset:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh k8s-staging-reset

staging-scale:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh k8s-staging-scale

staging-upgrade:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh k8s-staging-upgrade


#------------------------
production-cluster:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh k8s-production-cluster

production-remove:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh k8s-production-remove

production-reset:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh k8s-production-reset

production-scale:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh k8s-production-scale

production-upgrade:
	@cd ${PATH_KUBESPRAY} && ./kubespray-cmd.sh k8s-production-remove


#------------------------
# Terraform Services
#------------------------
trf-init:
	@cd ${PATH_TERRAGRUNT} && terraform init

trf-apply:
	@cd ${PATH_TERRAGRUNT} && terraform apply

trf-destroy:
	@cd ${PATH_TERRAGRUNT} && terraform destroy

trf-get:
	@cd ${PATH_TERRAGRUNT} && terraform get

trf-plan:
	@cd ${PATH_TERRAGRUNT} && terraform plan

trf-wrk-list:
	@cd ${PATH_TERRAGRUNT} && terraform workspace list

trf-wrk-select:
	@cd ${PATH_TERRAGRUNT} && terraform workspace select $1

trf-wrk-new:
	@cd ${PATH_TERRAGRUNT} && terraform workspace new $1


#------------------------
# Terragrunt Services
#------------------------
trg-apply:
	@cd ${PATH_TERRAGRUNT} && terragrunt apply

trg-destroy:
	@cd ${PATH_TERRAGRUNT} && terragrunt destroy

trg-get:
	@cd ${PATH_TERRAGRUNT} && terragrunt get

trg-output:
	@cd ${PATH_TERRAGRUNT} && terragrunt output

trg-plan:
	@cd ${PATH_TERRAGRUNT} && terragrunt plan
