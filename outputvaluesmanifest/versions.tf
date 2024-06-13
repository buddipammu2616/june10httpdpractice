#Terraform block
terraform {
  required_version = "~>1.8.5"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
  #Create a S3 bucket for Backend
  backend "s3" {
    bucket = "buddipammukushi"
    region = "ap-south-1"
    key = "mahesh/terraform.tfstate"
  }
}
#Provider Block
provider "aws" {
  region = var.aws_region
  profile = "default"
}
