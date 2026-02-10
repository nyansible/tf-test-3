# VPC Module - Using official terraform-aws-modules
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "${var.project_name}-vpc"
  cidr = var.vpc_cidr

  azs            = [var.availability_zone]
  public_subnets = [var.public_subnet_cidr]

  # Enable public IP assignment for instances in public subnets
  map_public_ip_on_launch = true

  # Internet Gateway is created automatically for public subnets
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Project = var.project_name
  }

  public_subnet_tags = {
    Name = "${var.project_name}-public-subnet"
  }
}

# Key Pair Module - Generates SSH key and stores in SSM
module "key_pair" {
  source = "./modules/key_pair"

  project_name = var.project_name
}

# Security Group Module
module "security_group" {
  source = "./modules/security_group"

  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

# EC2 Instances Module
module "ec2" {
  source = "./modules/ec2"

  instance_count     = 2
  instance_type      = var.instance_type
  subnet_id          = module.vpc.public_subnets[0]
  security_group_ids = [module.security_group.security_group_id]
  key_name           = module.key_pair.key_name
  project_name       = var.project_name
}
