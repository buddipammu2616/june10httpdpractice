#Create Output values
#Create a output value for public IP
output "ec2-instance-publicip" {
  description = "AWS Ec2 instance public ip"
  value = module.ec2_instance.public_ip
}
#Create a output value for public DNS
output "ec2-instance-publicDNS" {
  description = "AWS Ec2 instance public DNS"
  value = module.ec2_instance.public_dns
}
#Create a output value for private IP
output "ec2-instance-private-ip" {
    description = "AWS Ec2 Instance private IP"
    value = module.ec2_instance.private_ip
}