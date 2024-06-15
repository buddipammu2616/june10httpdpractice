#Create a Variable Region
# trunk-ignore(tflint/terraform_unused_declarations)
variable "aws_region" {
  description = "Region in which aws resource to be created"
  type = string
  default = "ap-south-1"
}
#Create a Variable for instance type
# trunk-ignore(tflint/terraform_unused_declarations)
variable "aws_instance_type" {
  description = "Aws_instance_type created"
  type = string
  default = "t2.small"
}
#Create a Variable for instance count
/*
variable "aws_instance_count" {
  description = "aws instance count created"
  type = number
  default = 1
}
*/