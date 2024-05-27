# EKS and ArgoCD Setup with Terraform

## Overview
This repository contains Terraform code for setting up an Amazon EKS (Elastic Kubernetes Service) cluster and configuring ArgoCD for continuous deployment. The infrastructure is managed using Terraform, allowing for easy provisioning and management of AWS resources.

## Features
- Provision an Amazon EKS cluster with specified configurations.
- Configure ArgoCD for continuous deployment and GitOps workflows.
- Manage infrastructure as code using Terraform for version-controlled deployments.

## Prerequisites
Before getting started, ensure you have:
- An AWS account with appropriate permissions.
- Terraform installed locally (version XX.XX.XX).
- Git installed for version control.

## Getting Started
1. Clone this repository:
   ```bash
   git clone https://github.com/nag-geek/eks-argocd-setup-terraform.git
   cd eks-argocd-setup-terraform

#Configure your AWS credentials:

export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"

#Initialize Terraform and apply the configuration:
terraform init
terraform plan
terraform apply

