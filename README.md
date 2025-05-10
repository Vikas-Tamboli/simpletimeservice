# SimpleTimeService

A simple Python microservice built with Flask that returns the current timestamp and the IP address of the caller in JSON format. This project is containerized using Docker and deployable on AWS using ECS Fargate with Terraform.

---

## 🚀 Features

- Lightweight Flask microservice
- Returns current timestamp and requester IP
- Dockerized with best practices (non-root user)
- Infrastructure deployment using Terraform on AWS ECS
- Clean and modular code + clear documentation

---

## 📁 Repository Structure

```
.
├── app/                 # Application code and Dockerfile
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
└── terraform/           # Terraform code for AWS ECS deployment
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── terraform.tfvars
```

---

## 🐳 Docker Support

### 📦 Build Docker Image

```bash
cd app
docker build -t simpletimeservice .
```

### 🏃 Run Locally via Docker

```bash
docker run -d -p 5000:5000 simpletimeservice
```

### 🔒 Non-root User Verification

Your container runs using a non-root user, in compliance with best practices.

---

## ☁️ AWS Deployment with Terraform

### 🌐 Architecture Overview

```
[User] --> [ALB:80] --> [ECS Service (Fargate)] --> [SimpleTimeService Container]
                |
         [VPC: 2 public + 2 private subnets]
```

### 🔧 Prerequisites

- AWS CLI configured (`aws configure`)
- Docker installed
- Terraform v1.5 or later
- AWS IAM user with permissions to deploy ECS, ALB, and VPC resources
- Public Docker image (`icecream7758/simpletimeservice:latest`)

---

### 📦 Docker Image: Build & Push

```bash
cd app
docker build -t icecream7758/simpletimeservice:latest .
docker push icecream7758/simpletimeservice:latest
```

Update the `container_image` value in `terraform/terraform.tfvars` accordingly:

```hcl
container_image = "icecream7758/simpletimeservice:latest"
```

---

### 📡 Deploy Infrastructure

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

After successful deployment, note the `alb_dns_name` output and visit it in your browser or via curl.

---

## ✅ Example Response

```json
{
  "timestamp": "2025-05-10T12:34:56Z",
  "ip": "13.59.24.108"
}
```

---

## 🧼 Cleanup Resources

```bash
terraform destroy
```

---

## 🛠 Tech Stack

- Python 3.8
- Flask
- Docker
- AWS ECS Fargate
- Application Load Balancer (ALB)
- Terraform

---

## 👨‍💻 Author

This project is a submission for the **Particle41 DevOps Team Challenge**.

Built by a DevOps Engineer passionate about infrastructure as code and clean automation.

---
