# 🚀 Pipeline CI/CD AWS ECS với Terraform

## 📌 Tổng quan

Project này mô phỏng một hệ thống CI/CD theo phong cách production, cho phép build, deploy và quản lý ứng dụng container trên AWS bằng Infrastructure as Code (Terraform).

Hệ thống tự động provision hạ tầng và deploy ứng dụng Docker lên ECS Fargate phía sau Application Load Balancer.

---

## 🏗️ Kiến trúc

* CI/CD: GitHub Actions
* Container: Docker
* Registry: Amazon ECR
* Compute: Amazon ECS (Fargate)
* Load Balancer: Application Load Balancer (ALB)
* Infrastructure: Terraform (IaC)
* State Management: S3 + DynamoDB (remote state)

---

## 🔁 Luồng hoạt động

1. Developer push code lên GitHub
2. GitHub Actions pipeline được trigger
3. Build Docker image
4. Push image lên Amazon ECR
5. Terraform apply để cập nhật hạ tầng
6. ECS service deploy version mới
7. ALB route traffic tới ECS tasks
8. Health check đảm bảo service hoạt động

---

## ⚙️ Tính năng chính

* Quản lý hạ tầng bằng Terraform (Infrastructure as Code)
* Remote state với S3 + DynamoDB (tránh duplicate resource)
* Pipeline CI/CD tự động hoàn toàn
* Không cần deploy thủ công
* Load balancing + health check qua ALB
* Deploy container bằng ECS Fargate

---

## 🧠 Các vấn đề thực tế & cách xử lý

### 1. Lệch Terraform State

* Vấn đề: Resource bị tạo lại mỗi lần pipeline chạy
* Giải pháp: Sử dụng S3 backend để share state

---

### 2. Lỗi IAM Role

* Vấn đề: ECS không assume được execution role
* Giải pháp: Fix trust relationship + attach policy đúng

---

### 3. Lỗi ALB 503

* Vấn đề: Target group không có backend
* Giải pháp: Sửa config ECS service + security group

---

### 4. VPC bị đầy quota

* Vấn đề: Resource leak do deploy nhiều lần
* Giải pháp: Cleanup và dùng remote state

---

## 📈 Kết quả đạt được

* Pipeline deploy hoàn toàn tự động
* Hạ tầng có thể tái tạo (reproducible)
* Mô phỏng môi trường production thực tế
* Ứng dụng truy cập được qua ALB

---

## 🧪 Cách chạy

```bash
git clone <repo>
cd terraform
terraform init
terraform apply
```

---

## 🔥 Hướng phát triển thêm

* Auto Scaling cho ECS Service
* Blue/Green Deployment
* Monitoring (Prometheus, Grafana)
* HTTPS (ACM + Route53)

---


