#Create A Security Group 
resource "aws_security_group" "maheshSGSSh" {
  name = "maheshSGSSh"
  description = "Mahesh Security Group"
  ingress  {
     description = "Allow port 22"
     from_port = 22
     to_port = 22
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
  }
  #Specify Inbound rule for port 80
  ingress {
    description = "Allow port 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #Specify outbound rules
  egress {
    description = "Allow all outbound rules"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}