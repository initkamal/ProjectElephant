
module "example-vpc" {
  source = "../../terraform/modules/vpc"

  create_vpc      = "true"
  vpc_name        = "example-vpc"
  cidr_ipv4_block = "10.0.0.0/16"

  private_subnets_list = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets_list  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  default_tags = {
    "managedBy" = "terraform"
    "env"       = "dev"
  }

  tags = {
    "project" = "elephant"
  }

  public_subnet_tags = {
    "internetAccess" = "yes"
  }

  private_subnet_tags = {
    "internetAccess" = "no"
  }

}