provider "aws" {
  region = "eu-central-1"
}


resource "aws_default_vpc" "gitlab_runner" {}

resource "aws_instance" "gitlab_runner" {
  ami           = "ami-023adaba598e661ac"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-02adeb0c68fefda1b"]
  key_name               = "progAcademy"
  # user_data              = file("./setup_gitlab_runner.sh")
  tags = {
    Name  = "gitlab_runner"
    Owner = "Oleg"
  }
}

output "aws_runner_ip" {
  value = aws_instance.gitlab_runner.public_ip
}

