provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAQTWBTB3Q5MZ5XXNC"
  secret_key = "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"
  region     = "us-east-1"
}
resource "aws_instance" "linux" {
  ami = "ami-0dfcb1ef8550277af"
  tags = {
    Name = "Linux-pavan"
  }
  instance_type   = "t2.micro"
  key_name        = "terraform-windows"
  security_groups = ["${aws_security_group.allow_ssh.name}"]
}
resource "aws_security_group" "allow_ssh" {
  tags = {
    Name = "pavan-sg"
  }
  name        = "allow_ssh"
  description = "allow ssh traffic only"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}































