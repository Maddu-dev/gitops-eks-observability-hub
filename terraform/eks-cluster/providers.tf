terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.35.1"
    }
  }

  backend "s3" {
    bucket = "tfstate-dev-us-east-1-xudizm"
    key = "eks/dev/terraform.tfstate"
    encrypt = true
    region = "us-east-1"
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
  region = var.aws_region
}