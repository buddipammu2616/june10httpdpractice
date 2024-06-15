#Create a EC2 instance
# trunk-ignore(tflint/terraform_required_providers)
resource "aws_instance" "maheshec2" {
  ami = data.aws_ami.amazonlinux.id
  instance_type = var.aws_instance_type
  key_name = "terraform-keypair"
  #count = var.aws_instance_count
  subnet_id = aws_subnet.maheshsubnet.id
  vpc_security_group_ids = [aws_security_group.maheshSG.id]
  user_data = file("apacheinstall.sh")
  tags = {
    "Name" = "Maheshec2"
  }
  associate_public_ip_address = true

#Connection block
Connection {
  type = "ssh"
  host = self.public_ip
  user = "ec2.user"
  password = ""
  terraformkeypair = "file(terraformkeypair/terraformkey.pem)"
}
# Copies the file-copy.html file to /tmp/file-copy.html
  provisioner "file" {
    source      = "apps/file-copy.html"
    destination = "/tmp/file-copy.html"
  }
  /*
  # Copies the string in content into /tmp/file.log
  provisioner "file" {
    content     = "ami used: ${self.ami}" # Understand what is "self"
    destination = "/tmp/file.log"
}
# Copies the app1 folder to /tmp - FOLDER COPY
  provisioner "file" {
    source      = "apps/app1"
    destination = "/tmp"
  }
  provisioner "file" {
    source      = "apps/app2/" # when "/" at the end is added - CONTENTS of FOLDER WILL BE COPIED
    destination = "/tmp"
  }*/
}