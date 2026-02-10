output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.vpc.public_subnets[0]
}

output "security_group_id" {
  description = "ID of the SSH security group"
  value       = module.security_group.security_group_id
}

output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = module.ec2.instance_ids
}

output "instance_public_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = module.ec2.public_ips
}

output "instance_private_ips" {
  description = "Private IP addresses of the EC2 instances"
  value       = module.ec2.private_ips
}

output "key_pair_name" {
  description = "Name of the SSH key pair"
  value       = module.key_pair.key_name
}

output "ssm_private_key_parameter" {
  description = "SSM parameter path for the private SSH key"
  value       = module.key_pair.ssm_parameter_name
}

output "get_private_key_command" {
  description = "AWS CLI command to retrieve the private key"
  value       = "aws ssm get-parameter --name '${module.key_pair.ssm_parameter_name}' --with-decryption --query 'Parameter.Value' --output text > ${module.key_pair.key_name}.pem && chmod 600 ${module.key_pair.key_name}.pem"
}

output "ssh_command_instance_1" {
  description = "SSH command to connect to instance 1 (after retrieving key)"
  value       = "ssh -i ${module.key_pair.key_name}.pem ubuntu@${module.ec2.public_ips[0]}"
}

output "ssh_command_instance_2" {
  description = "SSH command to connect to instance 2 (after retrieving key)"
  value       = "ssh -i ${module.key_pair.key_name}.pem ubuntu@${module.ec2.public_ips[1]}"
}
