#!/bin/bash
apt update -y
# Installing the kubectl first and modifing the file permissions and then moving the kubectl from current directory to usr/local/bin
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
# The following commands will update the machine once again and install the docker in to the machine
apt-get update && apt-get install docker.io -y
usermod -aG docker dileep
# Now the fun part begins we are installing minikube into the machine
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube && sudo mv minikube /usr/local/bin/
