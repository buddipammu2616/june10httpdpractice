#Create a VPc
resource "aws_vpc" "maheshVPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "maheshvpc"
  }
}
#Create Subnets
resource "aws_subnet" "maheshsubnet" {
  vpc_id = aws_vpc.maheshVPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
}
#Create InternetGateWay
resource "aws_internet_gateway" "maheshIGW" {
  vpc_id = aws_vpc.maheshVPC.id
}
#Create A Route Table
resource "aws_route_table" "maheshRT" {
  vpc_id = aws_subnet.maheshsubnet.id
}
#Create a Route in Route Table for Internet Access
resource "aws_route" "maheshRT" {
  route_table_id = aws_route_table.maheshRT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.maheshIGW.id
}
#Associate Route Table with the subnet
resource "aws_route_table_association" "maheshRTSAssociate" {
  route_table_id = aws_route_table.maheshRT.id
  subnet_id = aws_subnet.maheshsubnet.id
}
#Create a Security Group
resource "aws_security_group" "maheshSG" {
  name = "maheshSG"
  description = "Mahesh Security Group"
  vpc_id = aws_vpc.maheshVPC.id
  tags = {
    "Name" = "Mahesh Security Group"
  }
  ingress {
    description = "Allow port 22"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow port 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#Create a EIP
resource "aws_eip" "ElasticIp" {
  instance = aws_instance.maheshec2.id
  domain = "vpc"
  depends_on = [aws_internet_gateway.maheshIGW]
}