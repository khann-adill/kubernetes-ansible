# Kubernetes Ansible
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

## Verify cluster
Verify that you have deployed the cluster, check the cluster as following commands:
```sh
$ kubectl -n kube-system get po,svc

NAME      STATUS   ROLES                  AGE     VERSION   INTERNAL-IP    OS-IMAGE           KERNEL-VERSION   CONTAINER-RUNTIME
kmaster   Ready    control-plane,master   3h28m   v1.20.4   172.31.4.27  Ubuntu 20.04.2 LTS   5.4.0-1038-aws   cri-o://1.20.1
kworker   Ready    <none>                 3h25m   v1.20.4   172.31.13.91 Ubuntu 20.04.2 LTS   5.4.0-1038-aws   cri-o://1.20.1
...
```
