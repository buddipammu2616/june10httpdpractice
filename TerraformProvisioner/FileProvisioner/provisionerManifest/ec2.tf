#Create a EC2 instance
# trunk-ignore(tflint/terraform_required_providers)
resource "aws_instance" "maheshec2" {
  ami = data.aws_ami.amazonlinux.id
  instance_type = var.aws_instance_type
  key_name = "terraform-keypair"
  count = 1
  subnet_id = aws_subnet.maheshsubnet.id
  vpc_security_group_ids = [aws_security_group.maheshSG.id]
  user_data = file("apacheinstall.sh")
  tags = {
    "Name" = "Maheshec2"
  }
}