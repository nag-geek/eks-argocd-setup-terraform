variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.129.128.0/18"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.129.130.0/25"
}

variable "subnet_availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-2a"
}

variable "subnet_name" {
  description = "Name for the subnet"
  type        = string
  default     = "subnet-public-aza"
}

variable "eks_desired_capacity" {
  description = "Desired capacity for the EKS worker nodes"
  type        = number
  default     = 3
}

variable "eks_max_capacity" {
  description = "Max capacity for the EKS worker nodes"
  type        = number
  default     = 5
}

variable "eks_min_capacity" {
  description = "Min capacity for the EKS worker nodes"
  type        = number
  default     = 1
}

variable "eks_instance_type" {
  description = "Instance type for the EKS worker nodes"
  type        = string
  default     = "t2.micro"
}

