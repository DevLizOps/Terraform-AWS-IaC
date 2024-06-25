resource "aws_db_instance" "lizzM-RDS" {
  allocated_storage    = var.storage
  db_name              = var.db_name
  db_subnet_group_name = aws_db_subnet_group.lizzM-db-subnet-group.name
  vpc_security_group_ids = ["${var.sg-id}"]
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true
  apply_immediately    = true
}

resource "aws_db_subnet_group" "lizzM-db-subnet-group" {
  name       = "main"
  subnet_ids = [var.subnet, var.prv_subnet]

  tags = {
    Name = "My DB subnet group"
  }
}