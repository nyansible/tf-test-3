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

output "private_key_pem" {
  description = "Private SSH key (use: terraform output -raw private_key_pem > key.pem)"
  value       = module.key_pair.private_key_pem
  sensitive   = true
}

output "save_private_key_command" {
  description = "Command to save the private key to a file"
  value       = "terraform output -raw private_key_pem > ${module.key_pair.key_name}.pem && chmod 600 ${module.key_pair.key_name}.pem"
}

output "ssh_command_instance_1" {
  description = "SSH command to connect to instance 1 (after retrieving key)"
  value       = "ssh -i ${module.key_pair.key_name}.pem ubuntu@${module.ec2.public_ips[0]}"
}

output "ssh_command_instance_2" {
  description = "SSH command to connect to instance 2 (after retrieving key)"
  value       = "ssh -i ${module.key_pair.key_name}.pem ubuntu@${module.ec2.public_ips[1]}"
}
