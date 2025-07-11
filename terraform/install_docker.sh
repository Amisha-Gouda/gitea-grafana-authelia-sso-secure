#!/bin/bash

sudo yum update -y
sudo yum install -y docker git
sudo service docker start
sudo usermod -aG docker ec2-user
sudo yum update -y
sudo yum install -y docker git libxcrypt-compat

# Install Docker Compose
DOCKER_COMPOSE_VERSION=1.29.2
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

chown -R 472:472 /path/to/grafana/data

# Move into the project directory
cd /home/ec2-user/setup
docker-compose up -d
