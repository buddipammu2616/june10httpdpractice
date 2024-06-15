#create output values
#output values for creating publicip
output "ec2_instance_publicip" {
  description = "EC2 instance public ip"
  value = aws_instance.maheshec2.public_ip
}
#Create a output avlue for private ip
output "ec2_instance_privateip" {
  description = "EC2 instance private ip"
  value = aws_instance.maheshec2.private_ip
}
#create a output value for public Dns
output "ec2_instance_publicdns" {
  description = "EC2_instance_publicDNS"
  value = aws_instance.maheshec2.public_dns
}
#Create a output value For SG
output "EC2_security_Group" {
  description = "Ec2 Security Group"
  value = aws_instance.maheshec2.security_groups
}