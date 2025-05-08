module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "bank-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  public_subnet_tags = {
    "kubernetes.io/role/elb"             = "1"
    "kubernetes.io/cluster/bank-cluster" = "owned"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb"     = "1"
    "kubernetes.io/cluster/bank-cluster"  = "owned"
  }


  tags = {
    Terraform = "true"
    Environment = "dev-bank"
  }
}
