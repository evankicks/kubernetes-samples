#!/bin/bash

source ~/.ssh/environment
echo ${BASTION_USER}
echo ${TENANT}
echo ${DOCKER_ENV}
# This updates context in ~/.kube/config file if it doesn't exist
aws eks update-kubeconfig --name ${TENANT}-eks-${DOCKER_ENV}
# Execute kubectl-aws-iam-auth.sh present in k8s/base
sh /home/${BASTION_USER}/k8s/base/kubectl-aws-iam-auth.sh
cd /home/${BASTION_USER}/k8s/overlays/${TENANT}/${DOCKER_ENV}/
# -k indicates to apply using kustomize
kubectl apply -k .
