terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # Remote Backend
  backend "s3" {
    bucket         = "tfstate-dev-us-east-1-xudizm"
    key            = "vpc/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}