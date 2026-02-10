output "security_group_id" {
  description = "ID of the SSH security group"
  value       = aws_security_group.ssh.id
}

output "security_group_name" {
  description = "Name of the SSH security group"
  value       = aws_security_group.ssh.name
}
