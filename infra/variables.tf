variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-west-2"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
  default     = "eks-otel-demo"
}

variable "kubernetes_version" {
  type        = string
  description = "EKS Kubernetes version"
  default     = "1.29"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "node_instance_types" {
  type        = list(string)
  description = "Worker node instance types"
  default     = ["t3.large"]
}

variable "desired_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 4
}
