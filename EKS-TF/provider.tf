terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
# Provide region where you want to create EKS
provider "aws" {
  region = "us-east-1"
}
