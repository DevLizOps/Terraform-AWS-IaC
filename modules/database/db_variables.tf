variable "storage" {
 description = "The allocated storage in gibibytes."
}

variable "db_name" {
 description = "The name of the database to create when the DB instance is created."
}

variable "engine" {
 description = "The database engine to use."
}

variable "engine_version" {
 description = "The engine version to use."
}

variable "instance_class" {
 description = "The instance type of the RDS instance."
}

variable "db_username" {
 description = "Username for the master DB user."
}

variable "db_password" {
 description = "Password for the master DB user."
}

variable "parameter_group_name" {
 description = "Name of the DB parameter group to associate."
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

variable "vpc_security_group_ids" {
 description = "List of VPC security groups to associate."
}