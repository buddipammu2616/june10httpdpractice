#Create Output values
#output for EC2 instance public IP
output "aws_instance_publicip" {
  description = "EC2 instance public ip"
  value = aws_instance.maheshec2vmnew.public_ip
}
#output value for private IP
output "aws_instance_privateip" {
  description = "EC2instance private ip"
  value = aws_instance.maheshec2vmnew.private_ip
}
#output value for SG
output "security_group" {
  description = "Security Group"
  value = aws_instance.maheshec2vmnew.security_groups
}
#Output value for AMI Id
output "amazom_ami_id" {
  description = "latest amazon ami id"
  value = data.aws_ami.amazonlinuxamiid.id
}