#!/bin/bash

user=ubuntu
ip=3.20.203.105


printf "❌Removing existing SSH key\n"
rm -rf id_rs*
ssh-keygen -t rsa -b 2048 -f /home/adil/script/id_rsa -N "" >/dev/null 2>&1
printf "✅SSH key created\n"

printf "🔒Tranferring SSH key to remote host\n"
ssh-copy-id -i id_rsa.pub $user@$ip >/dev/null 2>&1


printf "✅start the ssh-agent in the background\n"
eval `ssh-agent -s`  >/dev/null 2>&1

printf "🔒Add your SSH private key to the ssh-agent\n"
ssh-add /home/adil/script/id_rsa  >/dev/null 2>&1
