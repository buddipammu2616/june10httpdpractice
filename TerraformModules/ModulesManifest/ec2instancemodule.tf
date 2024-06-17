#Create a module for ec2 instance
module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "~>5.0"
  name = "single-instance"
  ami = data.aws_ami.amzlinux
  instance_type          = "t2.micro"
  key_name               = "mahesh-keypair"
  monitoring             = true
  vpc_security_group_ids = ["sg-0906b76fb440f5fb5"]
  subnet_id              = "subnet-0af09486c6368c568"
  user_data              = file(apacheinstall.sh)
  tags = {
    Name        = "Ec2-Modules-Demo"
    Terraform   = "true"
    Environment = "dev"
  }
}
