#!/usr/bin/env sh

mkdir -p $GOPATH/src/github.com/terraform-providers; cd $GOPATH/src/github.com/terraform-providers

git clone git@github.com:terraform-providers/terraform-provider-google

cd $GOPATH/src/github.com/terraform-providers/terraform-provider-google

make build
