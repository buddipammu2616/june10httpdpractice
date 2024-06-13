#Terraform block
terraform {
  required_version = "~>1.8.5"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
  /*
  #Create a backend for S3
  backend "s3" {
    bucket = "buddipammukushi"
    region = "ap-south-1"
    key = "mahesh/terraform.tfstate"
    dynamodb_table = "buddipammudynamodbtable"
    encrypt = true
  }

*/
}
#Provider Block
provider "aws" {
  region = var.aws_region
  profile = "default"
}
