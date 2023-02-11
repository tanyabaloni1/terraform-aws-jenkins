#!/bin/bash

#Installing Java-11
sudo yum install java-11-amazon-corretto -y
sudo yum install unzip -y
sudo yum install zip -y

#Installing Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
jenkins --version

#Installing Docker
sudo amazon-linux-extras install docker -y
sudo usermod -a -G docker ec2-user
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
docker --version

#Installing Kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
kubectl version --client

#Installing Nginx
sudo amazon-linux-extras install nginx1 -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
nginx -t
nginx -version

#Installing Git
sudo yum install git -y
git --version

#Installing Aws-cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

#Installing Helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
chmod 700 get_helm.sh
sudo ./get_helm.sh
helm version --short | cut -d + -f 1