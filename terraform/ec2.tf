provider "aws" {
  region = "eu-central-1"
}

resource "aws_default_vpc" "default" {}

resource "aws_instance" "webserver-test" {
  ami                    = "ami-023adaba598e661ac"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver-test.id]
  key_name               = "progAcademy"
  #   user_data = file() pass to the some_script.sh file
  tags = {
    Name  = "Web Server"
    Owner = "Oleg"
  }
}

resource "aws_security_group" "webserver-test" {
  name        = "WebServer Security Group 3"
  description = "My security group"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Web Server"
    Owner = "Oleg"
  }

}

output "webserver_ip" {
  value = aws_instance.webserver-test.public_ip
}
