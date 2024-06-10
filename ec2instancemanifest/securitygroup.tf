#Create a Security Group
resource "aws_security_group" "maheshSG" {
  name = "maheshSG"
  description = "Create a Mahesh Security Group"
  vpc_id = aws_vpc.maheshvpc.id
  tags = {
    "Name" = "maheshSG"
  }

#Specify inbound rule for port 22
ingress {
  description = "Allow port 22"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
#specify Inbound rule for 80
ingress {
    description = "Allow port 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
#Specify outbound Rules
egress {
    description = "allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
}