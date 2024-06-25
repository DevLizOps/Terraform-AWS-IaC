resource "aws_subnet" "lizzM-private-subnet" {
  vpc_id     = aws_vpc.lizzM-VPC.id
  cidr_block = var.private_subnet_cdir_block
  map_public_ip_on_launch = true
  
  tags = {
    Name = "lizzM-private-subnet"
  }
}

resource "aws_nat_gateway" "lizzM-NAT-gw" {
  subnet_id = aws_subnet.lizzM-public-subnet.id
  connectivity_type = "private"
  
  tags = {
    Name = "lizzM-NAT-gw"
  }
  
  depends_on = [aws_internet_gateway.lizzM-gw]
}

resource "aws_route_table" "lizzM-private-rtb" {
  vpc_id = aws_vpc.lizzM-VPC.id
  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_nat_gateway.lizzM-NAT-gw.id
  }

  tags = {
    Name = "lizzM-private-rtb"
  }
}

resource "aws_route_table_association" "lizzM-private-rtb-A" {
  subnet_id      = aws_subnet.lizzM-private-subnet.id
  route_table_id = aws_route_table.lizzM-private-rtb.id
}