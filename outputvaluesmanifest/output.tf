#Create Output values
#output for EC2 instance public IP
output "aws_instance_publicip" {
  description = "EC2 instance public ip"
  value = aws_instance.maheshec2.public_ip
}
#output value for private IP
output "aws_instance_privateip" {
  description = "EC2instance private ip"
  value = aws_instance.maheshec2.private_ip
}
