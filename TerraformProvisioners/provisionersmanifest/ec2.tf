#Create a EC2 instance
resource "aws_instance" "maheshec2" {
  ami = data.aws_ami.amzlinux.id
  instance_type = var.aws_instance_type
  key_name = "mahesh-keypair"
  vpc_security_group_ids = [aws_security_group.maheshSG4.id]
  user_data = file("apacheinstall.sh")
  tags = {
    "Name" = "maheshec2"
  }
  # PLAY WITH /tmp folder in EC2 Instance with File Provisioner
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type = "ssh"
    host = self.public_ip # Understand what is "self"
    user = "ec2-user"
    password = ""
    private_key = file("private-key/mahesh-keypair.pem")
  }

 # Copies the file-copy.html file to /tmp/file-copy.html
  provisioner "file" {
    source      = "apps/file-copy.html"
    destination = "/tmp/file-copy.html"
  }
  # Copies the app1 folder to /tmp - FOLDER COPY
  provisioner "file" {
    source      = "apps/app1"
    destination = "/tmp"
  }
  provisioner "file" {
    source = "apps/app2/app2-file.html"
    destination = "/tmp"
  }
}