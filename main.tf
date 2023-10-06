provider "aws" {
  profile = "myaws"
  region  = var.region
}


resource "aws_s3_bucket" "b" {
  bucket = "mybucket1"
  acl    = "private"

  tags = {
    Name        = "Mybucket"
    Environment = "Dev"
  }
}

variable "region" {
  
}
