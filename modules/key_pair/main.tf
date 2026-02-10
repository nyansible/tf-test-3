resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "key_pair" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = "~> 2.0"

  key_name   = "${var.project_name}-key"
  public_key = tls_private_key.this.public_key_openssh

  tags = {
    Project = var.project_name
  }
}

resource "aws_ssm_parameter" "private_key" {
  name        = "/${var.project_name}/ec2/private-key"
  description = "Private SSH key for ${var.project_name} EC2 instances"
  type        = "SecureString"
  value       = tls_private_key.this.private_key_pem

  tags = {
    Project = var.project_name
  }
}
