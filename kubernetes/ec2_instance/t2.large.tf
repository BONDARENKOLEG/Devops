provider "aws" {
  region = "eu-central-1"
}

resource "aws_default_vpc" "kubernetes" {}

resource "aws_instance" "kubernetes" {
  ami           = "ami-023adaba598e661ac"
  instance_type = "t2.large"
  vpc_security_group_ids = ["sg-02adeb0c68fefda1b"]
  key_name               = "progAcademy"
  user_data = file("setup_docker.sh")
  tags = {
    Name  = "kubernetes"
    Owner = "Oleg"
  }
}

output "aws_runner_ip" {
  value = aws_instance.kubernetes.public_ip
}