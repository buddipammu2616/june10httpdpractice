#Create output values
#output value for creating public ip
output "ec2_instance_publicip" {
  description = "Ec2 instance public ip"
  value = aws_instance.maheshec2.public_ip
}
#Output value for creating private ip
output "ec2_instance_privateip" {
  description = "EC2 instance private ip"
  value = aws_instance.maheshec2.private_ip
}
#Output value for SG
output "ec2_security_group" {
  description = "EC2 SG"
  value = aws_instance.maheshec2.security_groups
}
#output value for public DNS
output "ec2_privatedns" {
  description = "private dns url of ec2 instance"
  value = "http://${aws_instance.maheshec2.private_dns}"
}