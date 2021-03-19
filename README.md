# Kubernetes Ansible AWS EC2
A collection of playbooks for deploying a Kubernetes development cluster onto machines, they are fully automated command to bring up a Kubernetes cluster on VM's or AWS EC2.

Feature list:
- [x] Support Kubernetes v1.19.0+.
- [x] Highly available development Kubernetes cluster.
- [x] Provisioning AWS EC2 Instances
- [x] Kubernetes addons:
  - [x] Helm.
  - [x] Metrics Server.
  - [x] NFS Dynamic Provisioning. 
  - [x] Kubernetes Dashboard.
- [x] Support container network:
  - [x] Calico.
  - [x] Flannel.
- [x] Support container runtime:
  - [x] Docker.
  - [x] Containerd.
  - [x] CRI-O.

## Quick Start
In this section you will deploy a cluster via AWS EC2.

Prerequisites:
* For running this ansible role for privisioning and setting up k8s cluster you need: Ubuntu 18.04 or above or RHEL but I have tested on Ubuntu based machine.
* Clone this Repo
* Need to steup Ansible on local machine.
```
$ sh py-ansible.sh
[❗️Updating & Installing Python Latest Version ]
[❗️Installing Ansible ]
[✅ successfully Installed Python3 & Ansible ]
```
* Create AWS IAM User with AdministratorAccess Permissions.
* Add IAM User Access key and Secret key in roles/infra/vars/cred.yml using Ansible Vault by using below command.
 ```
 $ ansible-vault edit roles/infra/vars/cred.yml and Add your Access key & Secret key.
 ```
 
### Key Features
Provisioning will create a custom ansible inventory file for setting up k8s cluster.
```
$cat /etc/ansible/custom_inv.ini
# This is custom inventory file which will use in setting up k8s cluster
[master]
34.**.**.150 ansible_ssh_private_key_file=/etc/ansible/id_rsa_aws

[worker]
52.**.**.189 ansible_ssh_private_key_file=/etc/ansible/id_rsa_aws

[kube_cluster:children]
master
worker
```

### Variables
Set the variables in `group_vars/all.yml` to reflect you need options.
```yml
# overide kubernetes version(default: 1.10.6)
kube_version: 1.20.4

# container runtime, supported: docker, containerd, crio
container_runtime: crio

# container network, supported: calico, flannel.
cni_enable: true
container_network: calico
cni_iface: ''

# highly available variables
vip_interface: ''
vip_address: 172.16.35.9

# etcd variables
etcd_iface: ''

# kubernetes extra addons variables
enable_dashboard: true
enable_logging: false
enable_monitoring: false
enable_ingress: false
enable_metric_server: true

```
### Provision AWS EC2 and deploy a Kubernetes cluster
If everything is ready, just run `./aws.sh` to provision ec2 and deploy the cluster on it:
```sh
$ sh aws-k8s.sh
Vault password:
```

![alt tag](https://github.com/khann-adill/kubernetes-ansible/blob/main/script/ansi%20status%20k8s.PNG)

## Verify cluster
Verify that you have deployed the cluster, check the cluster as following commands:
```sh
$ kubectl get nodes -o wide

NAME      STATUS   ROLES                  AGE     VERSION   INTERNAL-IP    OS-IMAGE           KERNEL-VERSION   CONTAINER-RUNTIME
kmaster   Ready    control-plane,master   3h28m   v1.20.4   172.31.4.27  Ubuntu 20.04.2 LTS   5.4.0-1038-aws   cri-o://1.20.1
kworker   Ready    <none>                 3h25m   v1.20.4   172.31.13.91 Ubuntu 20.04.2 LTS   5.4.0-1038-aws   cri-o://1.20.1
...
```
