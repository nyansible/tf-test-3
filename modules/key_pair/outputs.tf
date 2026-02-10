output "key_name" {
  description = "Name of the created key pair"
  value       = module.key_pair.key_pair_name
}

output "key_pair_id" {
  description = "ID of the created key pair"
  value       = module.key_pair.key_pair_id
}

output "ssm_parameter_name" {
  description = "SSM parameter name where private key is stored"
  value       = aws_ssm_parameter.private_key.name
}
