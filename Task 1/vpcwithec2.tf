provider "aws" {
    alias = "us-east"
  region = "us-east-1"
}
resource "aws_instance" "ec2" {
    
    ami = "ami-03a6eaae9938c858c" #linux image
    key_name = "terraform-key" 
    instance_type = "t2.micro" 
    subnet_id = aws_subnet.subnetec2.id 
    vpc_security_group_ids = [aws_security_group.sgec2.id]
}
resource "aws_vpc" "vpcec2" {
  cidr_block = "10.10.0.0/16"
}
resource "aws_subnet" "subnetec2" {
  vpc_id     = aws_vpc.vpcec2.id
  cidr_block = "10.10.1.0/24"
}

  resource "aws_internet_gateway" "gwec2" {
  vpc_id = aws_vpc.vpcec2.id
}
resource "aws_route_table" "rtec2" {
  vpc_id = aws_vpc.vpcec2.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gwec2.id
  }
}
resource "aws_route_table_association" "rtaec2" {
  subnet_id      = aws_subnet.subnetec2.id
  route_table_id = aws_route_table.rtec2.id
}

resource "aws_security_group" "sgec2" {
  name        = "sgec2"
  vpc_id      = aws_vpc.vpcec2.id

  ingress {
    
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}