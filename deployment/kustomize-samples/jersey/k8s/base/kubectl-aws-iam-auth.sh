#!/bin/bash

if [ -x "$(command -v kubectl)" ]; then
  echo 'Info: kubectl is installed.'
else 
  echo 'Info: kubectl is not installed. Installing version 1.15'
  curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/kubectl
  chmod +x ./kubectl
  mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
  echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
  kubectl version --short --client
fi

if [ -x "$(command -v aws-iam-authenticator)" ]; then
  echo 'Info: aws-iam-authenticator is installed.'
else  
  echo 'Info: aws-iam-authenticator is not installed. Installing the binary'
  curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator
  chmod +x ./aws-iam-authenticator
  mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$PATH:$HOME/bin
  echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
  aws-iam-authenticator version
fi

FILE=~/.kube/config
if [ -f "$FILE" ]; then
    echo "Kubeconfig exists"
else 
    echo "Kubeconfig doesn't exist at $FILE. Please create or copy a config"    
fi
