#!/bin/bash

if [[ $1 == "initcluster" ]]
then
	ansible-playbook .cluster.yml --ask-vault-pass	
elif [[ $1 == "addnode" ]]
then
	ansible-playbook .addnode.yml --ask-vault-pass
elif [[ $1 == "reset" ]]
then
	ansible-playbook .reset.yml --ask-vault-pass
else
	echo "Unsupported comannd..! please select from this [initcluster,addnode,reset]"
fi
