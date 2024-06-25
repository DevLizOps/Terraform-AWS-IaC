resource "aws_instance" "lizzM-ec2" {
 ami           = var.ami
 instance_type = var.instance_type
 subnet_id = var.subnet
 key_name = var.key_name
 vpc_security_group_ids  = ["${aws_security_group.lizzM-sg.id}"]
 
 user_data = <<-EOF
	     #!/bin/bash
	     sudo yum update -y
	     sudo yum install httpd -y
	     sudo systemctl start httpd
	     sudo systemctl enable httpd
	     EOF

 tags = {
  Name = "lizzM-ec2-instance"
 }
}

resource "aws_security_group" "lizzM-sg" {
 name = "lizzM-sg"
 description = "Allows HTTP, TLS and SSH inbound traffic and all outbound traffic."
 vpc_id      = var.vpc
 
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