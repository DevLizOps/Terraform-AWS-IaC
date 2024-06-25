provider "aws" {
 region = var.aws_region
}

module "vpc" {
 source = "./modules/vpc"
 vpc_cdir_block = "10.0.0.0/16"
 public_subnet_cdir_block = "10.0.0.0/24"
 private_subnet_cdir_block = "10.0.1.0/24"
 private_instance_id = module.compute.private_instance_id
}

module "compute" {
 source = "./modules/compute"
 subnet = module.vpc.public_subnet_id
 prv_subnet = module.vpc.private_subnet_id
 vpc = module.vpc.vpc_id
 instance_type = "t2.micro"
 key_name = "vockey"
 ami = "ami-08a0d1e16fc3f61ea"
}

module "database" {
 source = "./modules/database"
 storage = 10
 db_name = "mydb"
 engine = "mysql"
 engine_version = "8.0.37"
 instance_class = "db.t3.micro"
 db_username = "lizzM"
 db_password = "lizzMpwd"
 parameter_group_name = "default.mysql8.0"
 subnet = module.vpc.public_subnet_id
 prv_subnet = module.vpc.private_subnet_id
 vpc = module.vpc.vpc_id
 vpc_security_group_ids = module.compute.sg-id
}