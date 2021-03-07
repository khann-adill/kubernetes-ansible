#!/bin/bash

if [[ $# -eq 0 ]]
then
	echo "No hosts provided"
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
	echo "[master]" >> custom_inv.ini
	echo "[node]" >> custom_inv.ini
fi
