variable "instance_type" {
  description = "The type of EC2 instance that will be created."
  type = string
  default     = "t2.micro"
}

variable "aws_region" {
  description = "AWS region where resources will be created."
  default     = "us-east-1"
}

variable "vpc_cdir_block" {
  description = "Set of IP addresses that can be used within the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnet_cdir_block" {
  description = "Set of IP addresses that can be used within the public subnet."
  default     = "10.0.0.0/24"
}

variable "private_subnet_cdir_block" {
  description = "Set of IP addresses that can be used within the public subnet."
  default     = "10.0.1.0/24"
}

variable "key_name" {
  description = "The name for the key pair by which we can access our EC2 instances."
  default     = "vockey"
}

variable "ami" {
  description = "The Amazon Machine Image to create our EC2 instances."
  default     = "ami-08a0d1e16fc3f61ea"
}
