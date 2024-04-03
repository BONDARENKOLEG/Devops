provider "aws" {
  region = "eu-central-1"
}

resource "aws_default_vpc" "wildfly" {}

resource "aws_instance" "wildfly" {
  ami           = "ami-023adaba598e661ac"
  instance_type = "t2.micro"
  # vpc_security_group_ids = [aws_security_group.security.id]
  vpc_security_group_ids = ["sg-0d4676aa96b6421d2"]
  key_name               = "progAcademy"
  #   user_data = file() pass to the some_script.sh file
  tags = {
    Name  = "Wildfly"
    Owner = "Oleg"
  }
}

resource "aws_default_vpc" "jenkins" {}

resource "aws_instance" "jenkins" {
  ami           = "ami-023adaba598e661ac"
  instance_type = "t2.small"
  # vpc_security_group_ids = [aws_security_group.security.id]
  vpc_security_group_ids = ["sg-0d4676aa96b6421d2"]
  key_name               = "progAcademy"
  #   user_data = file() pass to the some_script.sh file
  tags = {
    Name  = "Jenkins"
    Owner = "Oleg"
  }
}

# resource "aws_security_group" "security" {
#   name        = "Wildfly Security Group 1"
#   description = "Wildfly Security Group "
#   vpc_id      = aws_default_vpc.wildfly.id

#   ingress {
#     protocol    = "tcp"
#     from_port   = 22
#     to_port     = 22
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     protocol    = "tcp"
#     from_port   = 443
#     to_port     = 443
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     protocol    = "tcp"
#     from_port   = 80
#     to_port     = 80
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     protocol    = "tcp"
#     from_port   = 8080
#     to_port     = 8080
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name  = "Wildfly"
#     Owner = "Oleg"
#   }

# }

output "wildfly_ip" {
  value = aws_instance.wildfly.public_ip
}

output "jenkins_ip" {
  value = aws_instance.jenkins.public_ip
}









