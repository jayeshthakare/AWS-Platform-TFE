provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_name    = var.vpc_name
  vpc_cidr    = var.vpc_cidr
  environment = var.environment
}

module "subnets" {
  source = "../../modules/subnets"

  vpc_id              = module.vpc.vpc_id
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
  environment         = var.environment
}
module "route_tables" {
  source = "../../modules/route-tables"

  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.vpc.internet_gateway_id
  public_subnet_id    = module.subnets.public_subnet_id

  environment = var.environment
}
module "security_groups" {
  source = "../../modules/security-groups"

  vpc_id      = module.vpc.vpc_id
  environment = var.environment
}
module "ec2" {
  source = "../../modules/ec2"

  instance_name = var.instance_name
  instance_type = var.instance_type

  subnet_id         = module.subnets.public_subnet_id
  security_group_id = module.security_groups.security_group_id

  key_name    = var.key_name
  environment = var.environment
}
output "vpc_id" {
  value = module.vpc.vpc_id
}
