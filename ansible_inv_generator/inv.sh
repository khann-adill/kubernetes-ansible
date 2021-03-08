#!/bin/bash

if [[ $# -eq 0 ]]
then
	printf "❌ No hosts provided.\n"
	exit 45
else
	echo "[master]" > custom_inv.ini
	echo $1 >> custom_inv.ini
	echo "[node]" >> custom_inv.ini
	for node_host in $@
	do		
		echo $node_host >> custom_inv.ini
	done
	sed -i '4d' custom_inv.ini
	echo "[kube-cluster:children]" >> custom_inv.ini
	echo "master" >> custom_inv.ini
	echo "node" >> custom_inv.ini
fi
printf "✅ Custom inventory file create successfully for setting up k8s cluster.\n"
echo " " 
printf "❗️If you wish to list the inventory host run below command ❗️\n"
printf " 🔒 ansible all -i custom_inv.ini --list-host 🔒 \n"
