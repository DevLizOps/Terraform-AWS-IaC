resource "aws_vpc" "lizzM-VPC" {
  cidr_block = var.vpc_cdir_block

  tags = {
   Name = "lizzM-VPC"
  }
}

resource "aws_internet_gateway" "lizzM-gw" {
  vpc_id = aws_vpc.lizzM-VPC.id

  tags = {
    Name = "lizzM-gw"
  }
}

resource "aws_subnet" "lizzM-public-subnet" {
  vpc_id     = aws_vpc.lizzM-VPC.id
  cidr_block = var.public_subnet_cdir_block
  map_public_ip_on_launch = true

  tags = {
    Name = "lizzM-public-subnet"
  }
}

resource "aws_security_group" "lizzM-sg" {
 name = "lizzM-sg"
 description = "Allows HTTP, TLS and SSH inbound traffic and all outbound traffic."
 vpc_id      = aws_vpc.lizzM-VPC.id
 
 ingress {
  from_port	  = 80
  to_port	    = 80
  protocol	  = "tcp"
  cidr_blocks	= ["0.0.0.0/0"]
 }
 
 ingress {
  from_port	  = 443
  to_port	    = 443
  protocol	  = "tcp"
  cidr_blocks	= ["0.0.0.0/0"]
 }

 ingress {
  from_port	  = 22
  to_port	    = 22
  protocol	  = "tcp"
  cidr_blocks	= ["0.0.0.0/0"]
 }  
  
 egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 } 
}

resource "aws_instance" "lizzM-ec2" {
 ami           = var.ami
 instance_type = var.aws_region
 subnet_id = aws_subnet.lizzM-public-subnet.id
 key_name = var.key_name
 vpc_security_group_ids  = ["${aws_security_group.lizzM-sg.id}"]
 user_data = <<-EOF
	     #!/bin/bash
	     sudo yum update -y && sudo yum install httpd -y && sudo systemctl start httpd && sudo systemctl enable httpd
	     EOF

 tags = {
  Name = "lizzM-ec2-instance"
 }
}

resource "aws_route_table" "lizzM-rtb" {
  vpc_id = aws_vpc.lizzM-VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lizzM-gw.id
  }

  tags = {
    Name = "lizzM-rtb"
  }
}

resource "aws_route_table_association" "lizzM-public-rtb-A" {
  subnet_id      = aws_subnet.lizzM-public-subnet.id
  route_table_id = aws_route_table.lizzM-rtb.id
}