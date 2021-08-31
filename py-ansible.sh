#!/bin/bash

os_name=$(grep '^NAME=' /etc/os-release | sed s'/NAME=//' | sed -e 's/^"//' -e 's/"$//')
if [[ $os_name == "Ubuntu" ]]
then
        echo "[Updating & Installing Python Latest Version]"
        sudo apt-get update -y >/dev/null 2>&1 && sudo apt-get install python3 -y >/dev/null 2>&1
        echo "[Installing Ansible]"
        sudo apt-get install ansible -y >/dev/null 2>&1

elif [[ $os_name == "Red Hat Enterprise Linux" ]]
then
        sudo yum update -y >/dev/null 2>&1
        sudo yum install python3 -y >/dev/null 2>&1
        pip3 install ansible >/dev/null 2>&1
        sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm >/dev/null 2>&1
        sudo yum install ansible -y >/dev/null 2>&1
else
        echo "[No Distro is unsupported by this script]"
        exit 1
fi
echo "[Successfully Installed Python3 & Ansible]"
exit 0
