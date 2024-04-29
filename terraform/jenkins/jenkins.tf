provider "aws" {
  region = "eu-central-1"
}

resource "aws_default_vpc" "jenkins" {}

resource "aws_instance" "jenkins" {
  ami           = "ami-023adaba598e661ac"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-02adeb0c68fefda1b"]
  key_name               = "progAcademy"
#   user_data              = file("./setup_jenkins.sh") //pass to the some_script.sh file
  tags = {
    Name  = "jenkins"
    Owner = "Oleg"
  }
}

output "aws_runner_ip" {
  value = aws_instance.jenkins.public_ip
}









