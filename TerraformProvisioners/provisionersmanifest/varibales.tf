#Create Variables
#Create a Variable for AWS Region
variable "aws_region" {
  description = "Region in which aws resources to be created"
  type = string
  default = "ap-south-1"
}