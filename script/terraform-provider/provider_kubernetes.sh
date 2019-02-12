#!/usr/bin/env sh

mkdir -p $GOPATH/src/github.com/terraform-providers; cd $GOPATH/src/github.com/terraform-providers

git clone git@github.com:terraform-providers/terraform-provider-kubernetes

cd $GOPATH/src/github.com/terraform-providers/terraform-provider-kubernetes

make build
