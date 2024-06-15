#Create a EC2 instance
resource "aws_instance" "maheshec2" {
  ami = data.aws_ami.amzlinux.id
  instance_type = var.aws_instance_type
  key_name = "mahesh-keypair"
  vpc_security_group_ids = [aws_security_group.maheshSG.id ]
  tags = {
    "Name" = "maheshec2"
  }
}