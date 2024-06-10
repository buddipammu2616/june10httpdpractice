#Create a vpc
resource "aws_vpc" "maheshvpc" {
    cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "maheshvpc"
  }
}
#Create subnets
resource "aws_subnet" "maheshsubnet" {
  vpc_id = aws_vpc.maheshvpc.id
  availability_zone = "ap-south-1a"
  cidr_block = "10.0.1.0/24"
  tags = {
    "Name" = "maheshsubnet"
  }
}
#Create Internet Gateway
resource "aws_internet_gateway" "maheshIG" {
  vpc_id = aws_vpc.maheshvpc.id
  tags = {
    "Name" = "MaheshIG"
  }
}
#Create a Route Table
resource "aws_route_table" "maheshRT" {
  vpc_id = aws_vpc.maheshvpc.id
  tags = {
    "Name" = "maheshRT"
    }
  }
#create a Route
resource "aws_route" "maheshRoute" {
  route_table_id = aws_route_table.maheshRT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.maheshIG.id
}
#Associate Route Table With the subnet
resource "aws_route_table_association" "maheshRTA" {
  subnet_id = aws_subnet.maheshsubnet.id
  route_table_id = aws_route_table.maheshRT.id
}
#create EC2 instance
resource "aws_instance" "maheshec2" {
  ami = "ami-00fa32593b478ad6e"
  instance_type = "t2.micro"
  key_name = "terraform-keypair"
  subnet_id = aws_subnet.maheshsubnet.id
  vpc_security_group_ids = [aws_security_group.maheshSG.id]
  user_data = file("apacheinstall.sh")
  }
