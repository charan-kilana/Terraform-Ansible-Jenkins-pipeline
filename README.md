# 🚀 Static Website Deployment using Terraform, Ansible & Jenkins

This project demonstrates a complete CI/CD workflow to deploy a **static website**. The infrastructure is created using **Terraform**, configuration and deployment handled by **Ansible**, and the entire process is orchestrated via **Jenkins**. Terraform state files are securely stored in an **S3 bucket**.

---

## 🧱 Architecture Overview

- **Terraform**: Used to provision infrastructure (e.g., EC2 slave server).
- **S3**: Stores Terraform state files for safe and consistent state management.
- **Ansible**: Deploys a static website to the provisioned server.
- **Jenkins**: Automates the entire flow — from infrastructure provisioning to deployment.
- **Slack**: Sends pipeline status notifications.
- **Splunk**: Collects and monitors Jenkins logs.

---

## 📂 Project Structure

```bash
.
├── main.tf              # Terraform config for EC2
├── variables.tf         # Input variables for Terraform
├── backend.tf           # S3 backend configuration
├── ansible/
│   └── playbook.yml     # Ansible playbook to deploy static site
├── Jenkinsfile          # CI/CD pipeline definition
└── README.md
```












