# provider information
provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAQTWBTB3Q5MZ5XXNC"
  secret_key = "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"
  region     = "us-east-1"
}

# userdata spin up with AWS EC2
resource "aws_instance" "linux" {
  ami = "ami-0dfcb1ef8550277af"
  tags = {
    Name = "web-server"
  }
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.allow_ssh_http.name}"]
  key_name        = "terraform-windows"
  user_data       = file("script.sh")

}

resource "aws_security_group" "allow_ssh_http" {
  tags = {
    Name = "pavan-sg"
  }
  name        = "allow_ssh_http"
  description = "allowing_ssh_http"

  vpc_id = "vpc-0d71c87a9bdd3b1f5"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}








































