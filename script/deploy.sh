#!/bin/bash

# Terraform apply
cd terraform
terraform init
terraform apply -auto-approve

# Install ArgoCD using Helm
cd ..
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
kubectl create namespace argocd
helm install argocd argo/argo-cd --namespace argocd

echo "Deployment completed!"

