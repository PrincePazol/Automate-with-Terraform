module "subnet" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/subnet"
}

module "route_table" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/route_table"
}

resource "aws_route_table_association" "RTa" {
  subnet_id = module.subnet.subnet_id
  route_table_id = module.route_table.rt_id
}