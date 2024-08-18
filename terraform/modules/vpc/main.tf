# VPC module which creates VPC resources on AWS

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"

  create_vpc             = var.create_vpc
  name                   = var.vpc_name
  cidr                   = var.cidr_ipv4_block
  azs                    = data.aws_availability_zones.available.names
  private_subnets        = var.private_subnets_list
  public_subnets         = var.public_subnets_list
  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  enable_dns_hostnames   = var.enable_dns_hostnames
  enable_dns_support     = var.enable_dns_support

  tags = merge(
    var.default_tags,
    var.tags
  )

  public_subnet_tags = merge(
    var.default_tags,
    var.public_subnet_tags
  )

  private_subnet_tags = merge(
    var.default_tags,
    var.private_subnet_tags
  )
}
