provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAQTWBTB3Q5MZ5XXNC"
  secret_key = "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"
  region     = "us-east-1"
}
resource "aws_instance" "linux" {
  ami = "ami-0c9978668f8d55984"
  tags = {
    Name = "linux-ec2"
  }
  instance_type = "t2.micro"
  key_name      = "terraform-windows"
}
resource "aws_security_group" "allow_ssh" {
  tags = {
    Name = "Allow-SSH"
  }
  name        = "allow_ssh"
  description = "allow all ssh tarffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}








