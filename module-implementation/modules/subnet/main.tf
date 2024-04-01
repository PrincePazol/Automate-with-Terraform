module "vpc" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/vpc"
}

# Create public subnet
resource "aws_subnet" "main-subnet" {
  vpc_id = module.vpc.vpc_id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  
  tags = {
    Name = "main-subnet"
  }
}