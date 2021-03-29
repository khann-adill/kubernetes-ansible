#!/bin/bash

if [[ $1 == "initcluster" ]]
then
	ansible-playbook .cluster.yml --ask-vault-pass	
elif [[ $1 == "addnode" ]]
then
	ansible-playbook .addnode.yml --ask-vault-pass
elif [[ $1 == "addon" ]]
then
	ansible-playbook .addon.yml 
elif [[ $1 == "reset" ]]
then
	read -p "Do you want to decommission the AWS resources(y/n):" confirm
	if [[ $confirm == "y" ]]
	then
		ansible-playbook .reset.yml --ask-vault-pass
	else
		echo "Decommission is cancelled by user"
	fi
else
	echo "Unsupported comannd..! please select from this [ initcluster , addon ,  addnode , reset ]"
fi
