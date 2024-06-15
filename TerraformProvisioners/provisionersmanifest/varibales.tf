#Create Variables
#Create a Variable for AWS Region
variable "aws_region" {
  description = "Region in which aws resources to be created"
  type = string
  default = "ap-south-1"
}
#Create a Variable for instance type
variable "aws_instance_type" {
  description = "AWS instance type created"
  type = string
  default = "t3.micro"
}