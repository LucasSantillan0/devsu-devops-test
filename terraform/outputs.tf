output "vpc_id" {
  description = "ID of the VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet."
  value       = module.vpc.public_subnet_id
}

output "instance_id" {
  description = "ID of the EC2 instance."
  value       = module.ec2.instance_id
}

output "instance_public_ip" {
  description = "Elastic IP associated with the EC2 instance."
  value       = module.ec2.public_ip
}

output "security_group_id" {
  description = "ID of the EC2 security group."
  value       = module.ec2.security_group_id
}

output "data_volume_id" {
  description = "ID of the additional EBS volume."
  value       = module.ec2.data_volume_id
}
