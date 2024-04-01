module "vpc" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/vpc"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "main"
  }
}