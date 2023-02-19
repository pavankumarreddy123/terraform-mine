provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAQTWBTB3Q5MZ5XXNC"
  secret_key = "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"
  region     = "us-east-1"
}
resource "aws_instance" "linux" {
  ami = "ami-0dfcb1ef8550277af"
  tags = {
    Name = "linux-computer"
  }
  instance_type = "t2.nano"
  count         = 3
  key_name      = "terraform-windows"
}






















