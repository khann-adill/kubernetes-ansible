#!/bin/bash

os_name=$(grep '^NAME=' /etc/os-release | sed s'/NAME=//' | sed -e 's/^"//' -e 's/"$//')
if [[ $os_name == "Ubuntu" ]]
then
        echo "[❗️ Updating & Installing Python Latest Version ]"
        sudo apt-get update -y >/dev/null 2>&1 && sudo apt-get install python3 -y >/dev/null 2>&1
        echo "[❗️ Installing Ansible ]"
        sudo apt-get install ansible -y >/dev/null 2>&1
elif [[ $os_name == "CentOS" ]]
then
        sudo yum update && sudo yum install python3 >/dev/null 2>&1
else
        echo "[ ❌No Distro is unsupported by this script ]❌"
fi
echo "[✅ successfully Installed Python3 & Ansible ]"
