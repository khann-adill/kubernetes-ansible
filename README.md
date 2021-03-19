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
* For running this ansible role for privisioning and setting up k8s cluster you need: Ubuntu 18.04 or above


### Provision AWS EC2 and deploy a Kubernetes cluster
If everything is ready, just run `./aws.sh` to provision ec2 and deploy the cluster on it:
```sh
$ ./aws-k8s.sh
Vault password:
...
TASK [k8s-addon/metric-server : Deploying Metric Server] ********************************Friday 19 March 2021  10:14:34 +0000 (0:00:29.398)       0:10:36.280 **********
changed: [34.254.163.150]

RUNNING HANDLER [k8s-addon/nfs-provisioner : Installing NFS client on Worker Nodes] *****Friday 19 March 2021  10:14:36 +0000 (0:00:02.385)       0:10:38.666 **********
changed: [34.254.163.150 -> 52.18.236.189] => (item=52.18.236.189)

PLAY RECAP *************************************************************************************************************************************************************
34.254.163.150             : ok=61   changed=46   unreachable=0    failed=0    skipped=5    rescued=2    ignored=0
52.18.236.189              : ok=32   changed=20   unreachable=0    failed=0    skipped=4    rescued=0    ignored=0
localhost                  : ok=24   changed=8    unreachable=0    failed=0    skipped=8    rescued=0    ignored=0

```


## Verify cluster
Verify that you have deployed the cluster, check the cluster as following commands:
```sh
$ kubectl get nodes -o wide

NAME      STATUS   ROLES                  AGE     VERSION   INTERNAL-IP    OS-IMAGE           KERNEL-VERSION   CONTAINER-RUNTIME
kmaster   Ready    control-plane,master   3h28m   v1.20.4   172.31.4.27  Ubuntu 20.04.2 LTS   5.4.0-1038-aws   cri-o://1.20.1
kworker   Ready    <none>                 3h25m   v1.20.4   172.31.13.91 Ubuntu 20.04.2 LTS   5.4.0-1038-aws   cri-o://1.20.1
...
```
