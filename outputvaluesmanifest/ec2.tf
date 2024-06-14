#Create EC2 instance
resource "aws_instance" "maheshec2vm" {
  ami = data.aws_ami.amazonlinuxamiid.id
  instance_type = var.aws_instance_type
  key_name = "terraform-keypair"
  user_data = file("apacheinstall.sh")
  vpc_security_group_ids = [aws_security_group.maheshSGSSh.id]
  tags = {
    "Name" = "maheshec2vmnew"
  }
}