output "instance_id" {
  description = "ID of the EC2 instance."
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "Elastic IP associated with the instance."
  value       = aws_eip.this.public_ip
}

output "security_group_id" {
  description = "ID of the instance security group."
  value       = aws_security_group.instance.id
}

output "data_volume_id" {
  description = "ID of the additional EBS volume."
  value       = aws_ebs_volume.data.id
}
