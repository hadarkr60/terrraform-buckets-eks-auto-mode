# AWS Terraform EKS & S3 Deployment

This project demonstrates two key infrastructure components using Terraform on AWS:

1. **S3 Buckets**: Provisioned using both the native Terraform AWS provider and the `terraform-aws-modules/s3-bucket` module.
2. **Amazon EKS (Auto Mode)**: A fully private Kubernetes cluster deployed with Terraform, including a sample Flask application exposed via an ALB.

---

## 📐 Architecture Overview

### Part 1: S3 Infrastructure
- Two identical S3 buckets provisioned using:
  - Native Terraform `aws_s3_bucket` resource.
  - `terraform-aws-modules/s3-bucket` module.

### Part 2: Private EKS Cluster (Auto Mode)
- EKS cluster with control plane and worker nodes in private subnets.
- Application deployed via Kubernetes manifests.
- Exposed using AWS ALB and Load Balancer Controller.
- Sample app automatically triggers node provisioning using Auto Mode features.

---

## 🚀 Technologies Used
- **Terraform**
- **Amazon EKS (Auto Mode)**
- **Amazon S3**
- **Kubernetes**
- **AWS ALB Controller**

---

## 📦 Project Structure

```text
terraform/
├── eks/         # EKS cluster on Auto Mode
│   ├── vpc/     # VPC, subnets, NAT Gateway
│   └── cluster/ # EKS cluster and worker node config
└── s3/          # Two S3 buckets using native + module

