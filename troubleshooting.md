# 🔧 Troubleshooting

### 1. SSL Certificate Errors
- **Symptom:** Browser warns about insecure or invalid certificates.
- **Solution:**  
  - Ensure you added the self-signed certificates to your local trust store (especially for custom domains like `*.mytest.local`).  
  - Check if the certificate files (`*.key` and `*.pem`) exist in `./nginx/certs/` folder.  
  - Regenerate certificates if expired or corrupted using the OpenSSL commands provided.

### 2. DNS Resolution Issues
- **Symptom:** Unable to access services via `gitea.mytest.local` or other custom domains.
- **Solution:**  
  - Confirm that your `/etc/hosts` (or Windows `C:\Windows\System32\drivers\etc\hosts`) file includes the correct EC2 IP mapping.  
  - Make sure you saved the hosts file and flush DNS cache if needed (`ipconfig /flushdns` on Windows).

### 3. Authelia Login Problems
- **Symptom:** Cannot authenticate or login fails repeatedly.
- **Solution:**  
  - Verify Authelia service logs using `docker-compose logs authelia` for errors.  
  - Check Authelia configuration file for correct backend and user details.  
  - Confirm time synchronization on your server (NTP), as time drift can cause token issues.

### 4. Docker Containers Not Starting or Crashing
- **Symptom:** One or more containers fail to start or keep restarting.
- **Solution:**  
  - Run `docker-compose ps` to check container status.  
  - Use `docker-compose logs <service>` to view detailed logs.  
  - Check if ports `80` and `443` are free and not blocked by firewall/security group.

### 5. Terraform Apply Fails
- **Symptom:** Errors during Terraform plan or apply.
- **Solution:**  
  - Ensure AWS credentials are configured correctly via `aws configure`.  
  - Verify the Terraform backend bucket `terraform-files-dev09` exists and you have access.  
  - Double-check your Terraform variables and environment.
