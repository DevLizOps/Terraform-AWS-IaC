resource "aws_instance" "lizzM-prv-ec2" {
 ami           = var.ami
 instance_type = var.instance_type
 key_name = var.key_name
 subnet_id = var.prv_subnet

 tags = {
  Name = "lizzM-prv-ec2-instance"
 }
}