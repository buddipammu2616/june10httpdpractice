#Input Variables
#Variable create for aws region
variable "aws_region" {
  description = "AWS Region variable created"
  type = string
  default = "us-east-1"
}
#Variable create for ami id
variable "aws_ami_id" {
  description = "AWS Ami id Variable created"
  type = string
  default = "ami-00beae93a2d981137"
}
#Variable create for Aws ec2 instance count
variable "aws_instance_count" {
  description = "EC2 instance count variable create"
  type = number
  default = 1
}
#Variable create for instance type
variable "aws_instance_type" {
  description = "Create a variable for instance type"
  type = string
  default = "t3.micro"
}