# 🔧 Secure Git and Grafana Monitoring Platform with Authelia SSO

This project sets up a **secure, containerized Git service (Gitea)**, **monitoring with Grafana**, and **Single Sign-On (SSO) using Authelia**, all routed through a **reverse proxy** (Nginx). The infrastructure is provisioned via Terraform, and containerized using Docker Compose.

---

## Features Implemented

1. **Gitea** - Self-hosted Git service
2. **Grafana** - Monitoring and data visualization
3. **Authelia** - Single Sign-On (SSO) provider
4. **Reverse Proxy** - Nginx (with integrated Authelia support)
5. **Dockerized Services** - All components run in containers via Docker Compose
6. **Terraform IAC** - Reusable and idempotent infrastructure provisioning
7. **Loki** - Log aggregation and visualization in Grafana
---

## Architecture Overview


---

## Prerequisites

- AWS EC2 instance (Linux)
- Docker & Docker Compose
- Terraform
- Open Security Group ports: `80`, `443`.
- AWS CLI

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/Amisha-Gouda/gitea-grafana-authelia-sso-secure.git
cd gitea-grafana-authelia-sso-secure
```

### 2. Generate Self-Signed SSL Certificates for HTTPS
#### Authelia SSL Certificate
```bash
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout ./nginx/certs/authelia.key \
  -out ./nginx/certs/authelia.pem \
  -subj "/CN=authelia.mytest.local"
```
#### Gitea SSL Certificate
```bash
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout ./nginx/certs/gitea.key \
  -out ./nginx/certs/gitea.pem \
  -subj "/CN=gitea.mytest.local"
```

#### Grafana SSL Certificate
```bash
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout ./nginx/certs/grafana.key \
  -out ./nginx/certs/grafana.pem \
  -subj "/CN=grafana.mytest.local"
```

### 3. Configure AWS CLI Access
```bash
Before running Terraform, you need to configure your AWS credentials using an Access Key and Secret Key.
2.1  Generate Access Key & Secret Key
    - Navigate to: My Security Credentials → Access Keys → Create access key
    - Download or copy the Access Key ID and Secret Access Key
2.2 Then configure using: aws configure
```

### 4. Provision Infrastructure (Terraform)

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### 5. Local DNS Configuration
```bash
To access services via custom domain names, add these entries to your `/etc/hosts` file:
<your-ec2-ip>   gitea.mytest.local grafana.mytest.local authelia.mytest.local
```

### 6. Access URLS
```bash
🌐 Gitea: http://gitea.mytest.local
📊 Grafana: http://grafana.mytest.local
🔐 Authelia: http://authelia.mytest.local
```

### 7. Results:

## 7.1 Gitea 
- Access via `http://gitea.mytest.local`
- Protected by SSO via Authelia
![alt text](images/image-2.png)
- Hosted Git repositories
![alt text](images/image-9.png)

## 7.2 Grafana
- Access via `http://grafana.mytest.local`
- Protected by SSO via Authelia
![alt text](images/image-4.png)
- Real-time monitoring of system health
![alt text](images/image-5.png)
![alt text](image-12.png)
- Integrated Loki data source for log streaming
![alt text](images/image-6.png)
- Gitea and Authelia monitoring dashboards
![alt text](images/image-7.png)
![alt text](images/image-8.png)

### 7.3 Authelia SSO
- Handles authentication for Gitea and Grafana
- Accessible at `http://authelia.mytest.local`
![alt text](images/image-10.png)
![alt text](images/image-11.png)