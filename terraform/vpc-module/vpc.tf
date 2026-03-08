module "vpc" {
    source = "./modules/vpc"
    environment_name = var.environment_name
    cidr_block = var.cidr_block
    subnet_newbits = var.subnet_newbits
    tags = var.tags
}