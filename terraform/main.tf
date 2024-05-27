provider "aws" {
  region = "us-west-2"
}

# Define the VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.129.128.0/18"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name"             = "vpc"
    "application_role" = "NA"
    "info_description" = "vpc"
    "environment"      = "prod"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# Create Route Table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# Create Subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.129.130.0/25"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name           = "subnet-public-aza"
    subnet_group   = "public"
    environment    = "prod"
  }
}

# Associate Route Table with Subnets
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.my_route_table.id
}

# Define EKS Cluster module
module "eks_cluster" {
  source = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name     = "eks-cluster"
  cluster_version  = "1.20"
  subnets          = [aws_subnet.public_subnet_1.id]
  vpc_id           = aws_vpc.my_vpc.id
  node_groups = {
    eks_workers = {
      desired_capacity = 3
      max_capacity     = 5
      min_capacity     = 1
      instance_type    = "t2.micro"
    }
  }
}

# Output EKS Cluster details
output "eks_cluster_id" {
  value = module.eks_cluster.cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks_cluster.cluster_endpoint
}

output "eks_cluster_security_group_id" {
  value = module.eks_cluster.cluster_security_group_id
}

output "eks_node_security_group_id" {
  value = module.eks_cluster.worker_security_group_id
}

