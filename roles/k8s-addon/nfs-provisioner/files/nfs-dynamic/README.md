## Making Storage Class as default
```
kubectl patch storageclass managed-nfs-storage -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```

### Script for auto change master IP and upgrade the helm list
```
#!/bin/bash

echo "Getting Ip of K8s Master"
new_ip=$( ssh -o StrictHostKeyChecking=no -l root master  "curl -s ifconfig.co" )
echo $new_ip
old_ip=$(cat /home/ubuntu/nfs-dynamic/values.yaml | grep "nfs_server" | cut -d ' ' -f2)
echo "Setting IP of Values.yaml"
sed -i 's/'$old_ip'/'$new_ip'/' /home/ubuntu/nfs-dynamic/values.yaml
helm upgrade nfs-dynamic /home/ubuntu/nfs-dynamic/.
sleep 5
echo "Getting old nfs pod"
pod=$(kubectl get pods | grep nfs | cut -d ' ' -f1)
echo "Deleting old pod"
kubectl delete pods $pod --force
```

#### NFS Dynamic Issue with version v1.20.0 k8s cluster. Which make pod in pending state
```
There was a problem with k8s Version v1.20.0.
We need to modify default kube-apiserver.yaml file.

Steps:

Open kube-apiserver.yaml file
vim /etc/kubernetes/manifests/kube-apiserver.yaml
Need to add below line on line after this:
spec:
containers:
- command:
- --feature-gates=RemoveSelfLink=false
```
