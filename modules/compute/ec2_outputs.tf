output "public_ip" {
 value = resource.aws_instance.lizzM-ec2.public_ip
}

output "private_ip" {
 value = resource.aws_instance.lizzM-ec2.private_ip
}

output "private_instance_id" {
 value = resource.aws_instance.lizzM-ec2.id
}

output "sg-id" {
  value = resource.aws_security_group.lizzM-sg.id
}