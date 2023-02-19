provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAQTWBTB3Q5MZ5XXNC"
  secret_key = "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"
  region     = "us-east-1"
}
resource "aws_s3_bucket" "bucket" {
  bucket = "my-pavan-tf-aws"
  tags = {
    Name        = "my-bucket"
    environment = "test"
  }
}





























