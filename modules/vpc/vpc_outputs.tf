output "vpc_id" {
  value = resource.aws_vpc.lizzM-VPC.id
}

output "public_subnet_id" {
  value = resource.aws_subnet.lizzM-public-subnet.id
}

output "private_subnet_id" {
  value = resource.aws_subnet.lizzM-private-subnet.id
}