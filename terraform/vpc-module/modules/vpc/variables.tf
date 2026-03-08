
variable "cidr_block" {
    description = "CIDR block"
    type = string
    default = "10.0.0.0/16" 
}

variable "subnet_newbits" {
    description = "Number of new bits to add to VPC CIDR to generate subnets (e.g., 8 means /24 from /16)"
    type = number
    default = 8
}

variable "environment_name" {
    description = "Environment name"
    type = string
    default = "dev"
}

variable "tags" {
    description = "Global tags"
    type = map(string)
    default = {
      "Terraform" = "true"
    }
  
}

