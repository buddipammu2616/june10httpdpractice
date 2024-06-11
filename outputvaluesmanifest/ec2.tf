#Create EC2 instance
resource "aws_instance" "maheshec2" {
  ami = "ami-00fa32593b478ad6e"
  instance_type = "t3.micro"
  key_name = "terraform-keypair"
  user_data = file("apacheinstall.sh")
}