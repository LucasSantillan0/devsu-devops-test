variable "name" {
  description = "Name prefix applied to all resources."
  type        = string
  default     = "devsu"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet, EC2 and EBS volume."
  type        = string
  default     = "sa-east-1a"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "Existing EC2 key pair name. Leave null to create the instance without SSH key authentication."
  type        = string
  default     = null
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to connect over SSH. Restrict this to a trusted IP range."
  type        = string
  default     = "0.0.0.0/0"
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB."
  type        = number
  default     = 20
}

variable "data_volume_size" {
  description = "Additional EBS volume size in GiB."
  type        = number
  default     = 20
}

