#Terraform block
terraform {
  required_version = "~>1.8.5"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
}
#Provider Block
provider "aws" {
  region = "ap-south-1"
  profile = "default"
}
