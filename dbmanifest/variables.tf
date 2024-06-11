#Create variable for region
variable "aws_region" {
  description = "create a variable for AWS Region"
  type = string
  default = "ap-south-1"
}
#Create username for Dtbase
variable "aws_db_username" {
  description = "Create a data base username"
  type = string
  sensitive = true
}
#Create a Password for Database
variable "aws_db_password" {
  description = "Creaet a data base password"
  type = string
  sensitive = true
}