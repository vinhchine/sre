# 🚀 Production-like SRE CI/CD Pipeline trên AWS

Project DevOps/SRE mô phỏng hệ thống deployment thực tế sử dụng Terraform, Docker, ECS Fargate, ECR, ALB và GitHub Actions trên AWS.

Project tập trung vào:
- Infrastructure as Code
- CI/CD automation
- Container orchestration
- Immutable deployment
- Rollback strategy
- Debugging production-like issues

---

# 📌 Tổng quan hệ thống

Pipeline triển khai tự động theo flow:


Developer
   ↓
Git Push
   ↓
GitHub Actions CI/CD
   ↓
Build Docker Image
   ↓
Push Image → Amazon ECR
   ↓
Terraform Apply
   ↓
AWS ECS Fargate
   ↓
Application Load Balancer
   ↓
User Request
