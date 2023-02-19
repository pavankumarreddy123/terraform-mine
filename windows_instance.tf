provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAQTWBTB3Q5MZ5XXNC"
  secret_key = "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"
  region     = "us-east-1"
}
resource "aws_instance" "windows" {
  ami = "ami-0c2b0d3fb02824d92"
  tags = {
    Name = "windows-ec2"
  }
  instance_type = "t2.micro"
  key_name      = "terraform-windows"
}

resource "aws_security_group" "allow_rdp" {

  name        = "allow_rdp"
  description = "allow trffic"

  ingress {
    from_port   = 3389 # by default the windows server listens to tcp port 3389 for rdp
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

