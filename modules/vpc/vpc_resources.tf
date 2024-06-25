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