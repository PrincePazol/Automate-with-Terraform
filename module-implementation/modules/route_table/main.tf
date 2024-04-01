module "internet_gateway" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/internet_gateway"
}

module "vpc" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/vpc"
}

resource "aws_route_table" "RT" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = var.cidr
    gateway_id = module.internet_gateway.gw_id
  }

  tags = {
    Name = "main"
  }
}