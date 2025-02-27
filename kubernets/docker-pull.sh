#!/bin/bash
url=registry.cn-hangzhou.aliyuncs.com/google_containers
version=v1.20.1
images=(`kubeadm config images list --kubernetes-version=v1.20.1 | awk -F "/" '{print $2}'`)

for imagename in ${images[@]}
do
        docker pull $url/$imagename
        docker tag $url/$imagename k8s.gcr.io/$imagename
        #docker save -o /root/kube-images/$imagename.tar.gz k8s.gcr.io/$imagename
        docker rmi -f $url/$imagename
        #docker rmi -f k8s.gcr.io/$imagename
done
