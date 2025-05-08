# 🚀 AWS Terraform EKS & S3 Infrastructure

This project demonstrates Terraform-based provisioning of secure, production-ready AWS resources:

1. **Amazon S3**: Two highly secure and compliant buckets using both native and module-based Terraform approaches.
2. **Amazon EKS (Auto Mode)**: A fully private Kubernetes cluster with automated compute scaling and a sample Flask application deployment.

---

## 🏗️ Architecture Overview

### Part 1: Secure S3 Buckets

Provisioned two S3 buckets:

- **Bucket A**: Using native `aws_s3_bucket` resources.
- **Bucket B**: Using `terraform-aws-modules/s3-bucket`.

🔐 Both buckets meet **bank-grade standards**:
- **Server-side encryption** (`AES256`)
- **Versioning enabled** for data recovery
- **Block all public access**
- **Tags and lifecycle rules** for future auditing and governance

---

### Part 2: EKS Cluster (Auto Mode, Private)

Provisioned a fully **private** EKS cluster using **Auto Mode**:
- Control plane and nodes in **private subnets**
- Nodes are provisioned **on-demand** via Auto Mode
- Cluster endpoint is private-only (no public API access)
- Application deployed using Kubernetes manifests and exposed via **AWS ALB**

---

## 🔧 Tech Stack

- [Terraform]
- [Amazon S3]
- [Amazon EKS]
- [Kubernetes]
- [AWS Load Balancer Controller]

---

## 📂 Project Structure

```text
terraform/
├── eks/
│   ├── vpc/         # VPC, subnets, NAT gateway
│   └── cluster/     # EKS cluster (Auto Mode, private)
└── s3/
    ├── native/      # S3 bucket using aws_s3_bucket
    └── module/      # S3 bucket using s3 module

