variable "instance_type" {
 description = "The type of EC2 instance that will be created."
 type = string
}

variable "key_name" {
 description = "The name for the key pair by which we can access our EC2 instances."
}

variable "ami" {
 description = "The Amazon Machine Image to use for the EC2 instances."
}

variable "subnet" {
 description = "The public subnet's ID."
}

variable "prv_subnet" {
 description = "The private subnet's ID."
}

variable "vpc" {
 description = "The VPC's ID."
}