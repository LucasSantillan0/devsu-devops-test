variable "name" {
  description = "Name prefix for EC2 resources."
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "subnet_id" {
  description = "Subnet where the instance will run."
  type        = string
}

variable "vpc_id" {
  description = "VPC where the security group will be created."
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the EBS volume."
  type        = string
}

variable "key_name" {
  description = "Existing EC2 key pair name."
  type        = string
  default     = null
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to access SSH."
  type        = string
}

variable "root_volume_size" {
  description = "Root volume size in GiB."
  type        = number
}

variable "data_volume_size" {
  description = "Additional EBS volume size in GiB."
  type        = number
}

