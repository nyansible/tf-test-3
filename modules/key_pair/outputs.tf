output "key_name" {
  description = "Name of the created key pair"
  value       = aws_key_pair.this.key_name
}

output "key_pair_id" {
  description = "ID of the created key pair"
  value       = aws_key_pair.this.id
}

output "private_key_pem" {
  description = "Private key in PEM format (sensitive)"
  value       = tls_private_key.this.private_key_pem
  sensitive   = true
}
