variable "aws_region" {
  description = "AWS region where resources will be created."
  default     = "us-east-1"
}

variable "tfstate_bucket" {
  description = "The S3 bucket that will save remotely our tfstate's backup."
  default     = "my-tfstate-bucket"
}
