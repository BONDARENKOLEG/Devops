provider "aws" {
  region = "eu-central-1"
}

# resource "aws_default_vpc" "wildfly" {}

# resource "aws_instance" "wildfly" {
#   ami           = "ami-023adaba598e661ac"
#   instance_type = "t2.micro"
#   # vpc_security_group_ids = [aws_security_group.oleg_security_group.id]
#   vpc_security_group_ids = ["sg-02adeb0c68fefda1b"]
#   key_name               = "progAcademy"
#   # user_data              = file("../shell-scripts/setup_docker_git.sh") // pass to the some_script.sh file
#   tags = {
#     Name  = "wildfly"
#     Owner = "Oleg"
#   }
# }

resource "aws_default_vpc" "aws_runner" {}

resource "aws_instance" "aws_runner" {
  ami           = "ami-023adaba598e661ac"
  instance_type = "t2.micro"
  # vpc_security_group_ids = [aws_security_group.security.id]
  vpc_security_group_ids = ["sg-02adeb0c68fefda1b"]
  key_name               = "progAcademy"
  user_data              = file("../shell-scripts/setup_gitlab_runner.sh") //pass to the some_script.sh file
  tags = {
    Name  = "aws_runner"
    Owner = "Oleg"
  }
}

# resource "aws_security_group" "oleg_security_group" {
#   name        = "Oleg Security Group"
#   description = "Oleg Security Group"
#   vpc_id      = aws_default_vpc.gitLab.id

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
#     Name  = "Oleg Security"
#     Owner = "Oleg"
#   }

# }

# output "wildfly_ip" {
#   value = aws_instance.wildfly.public_ip
# }

output "aws_runner_ip" {
  value = aws_instance.aws_runner.public_ip
}









