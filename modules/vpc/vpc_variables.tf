variable "vpc_cdir_block" {
 description = "Set of IP addresses that can be used within the VPC."
}

variable "public_subnet_cdir_block" {
 description = "Set of IP addresses that can be used within the public subnet."
}

variable "private_subnet_cdir_block" {
 description = "Set of IP addresses that can be used within the private subnet."
}

variable "private_instance_id" {
 description = "The ID of the EC2 instance within the private subnet."
}