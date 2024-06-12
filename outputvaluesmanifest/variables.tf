#Create variables
#create a variable for region
variable "aws_region" {
  description = "AWS Region created"
  type = string
  default = "ap-south-1"
}
/*
#Create a variable for ami id
variable "aws_ami_id" {
  description = "AWS Ami id created"
  type = string
  default = "ami-00fa32593b478ad6e"
}
*/
#Create a variable for aws instance count
variable "aws_instance_count" {
  description = "AWS instance count create"
  type = number
  default = 1
}
#Create a variable for instance type
variable "aws_instance_type" {
    description = "AWS instamce type created"
   type = string
   default = "t3.micro"
}
