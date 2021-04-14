############################################################# PLAY WITH KUBECTL #############################################################################
#       Setting up hostname as kmaster
#       system compatible: Ubuntu:18.04.5 LTS (Bionic Beaver) and 20.04.1 LTS (Focal Fossa).     
#       Maintainer: Adil Abdullah Khan  
#       To Run this script:
#       curl  https://raw.githubusercontent.com/adil1806/play-with-kubectl/master/kubernetes-installation/set-hostname-kmaster.sh | bash
#############################################################################################################################################################

#!/bin/bash

echo "[TASK 1] Setting hostname for this node to Kmaster"
hostnamectl set-hostname kmaster >/dev/null 2>&1

echo "[TASK 2] Adding newly created hostname to hosts file"
sed -i 's/^127.0.0.1 .*/127.0.0.1 localhost kmaster/' hosts >/dev/null 2>&1

echo "[Task 3] Please restart/reboot this system by ourself"
