provider "aws" {
  region = "sa-east-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "vpc" {
  source = "./modules/vpc"

  name               = var.name
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

module "ec2" {
  source = "./modules/ec2"

  name              = var.name
  ami_id            = data.aws_ami.amazon_linux.id
  instance_type     = var.instance_type
  subnet_id         = module.vpc.public_subnet_id
  vpc_id            = module.vpc.vpc_id
  availability_zone = var.availability_zone
  key_name          = var.key_name
  allowed_ssh_cidr  = var.allowed_ssh_cidr
  root_volume_size  = var.root_volume_size
  data_volume_size  = var.data_volume_size
}
