variable "aws_region" {
    description = "aws region"
    type = string
    default = "us-east-1"
}

variable "cluster_version" {
    description = "Kubernetes minor version to use for the EKS Cluster "
    type = string
    default = null
}

variable "environment_name" {
    description = "Environment name"
    type = string
    default = "dev"
}

variable "business_division" {
  description = "business division infra belongs to"
  type = string
  default = "retail"
}

variable "cluster_name" {
    description = "Name of the cluster"
    type = string
    default = "eksmaddu"
}

variable "cluster_service_ipv4_cidr" {
    description = "Service CIDR range for Kubernetes"
    type = string
    default = null
}

variable "cluster_endpoint_public_access" {
    description = "whether to enable public access to EKS Control plane endpoint"
    type = bool
    default = true
}

variable "cluster_endpoint_public_access_cidr" {
    description = "list of CIDR blocks allowed to access public EKS endpoint"
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "cluster_endpoint_private_access" {
    description = "whether to enable private access for EKS endpoint"
    type = bool
    default = false
}

variable "tags" {
    description = "Tags to apply to EKS and related resources"
    type = map(string)
    default = {
      "Terraform" = "true"
    } 
}

variable "node_instance_type" {
    description = "List of EC2 instance types for the node group"
    type = list(string)
    default = [ "t3.medium" ]
}

variable "node_disk_size" {
    description = "Disk size in GiB for worker nodes"
    type = number
    default = 20
}

variable "node_capacity_type" {
    description = "Instance capacity type: ON_DEMAND or SPOT"
    type = string
    default = "ON_DEMAND"
}