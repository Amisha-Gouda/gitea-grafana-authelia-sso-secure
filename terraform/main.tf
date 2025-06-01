provider "aws" {
  region = var.region
}

resource "aws_security_group" "authelia-protected-server-sg" {
  name        = "authelia-protected-server-sg"
  description = "Allow ports for Gitea, Nginx, Grafana, etc"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "gitea_ec2" {
  ami           = var.ami_id # Amazon Linux 2 
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.authelia-protected-server-sg.name]

  user_data = file("${path.module}/install_docker.sh")

  provisioner "file" {
    source      = "../setup"
    destination = "/home/ec2-user/setup"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key_path) 
    host        = self.public_ip
  }

  tags = {
    Name = "authelia-protected-server"
  }
}
