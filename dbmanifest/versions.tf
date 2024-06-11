#Terraform Block
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
  required_version = "~>1.8.5"
}#provider Block
provider "aws" {
  region = var.aws_region
  profile = default
}