#!/bin/bash

#ansible -m ping kube-cluster --private-key=/etc/ansible/id_rsa_aws
ansible -m ping kube-cluster --private-key=$1
