module "key_name" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/key_name"
}

module "subnet" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/subnet"
}

module "security_group" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/security_groups"
}

module "ec2_instance" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/ec2_instance"
  ami = var.ami[0]
  instance_type = var.instance_type[0]
  availability_zone = var.availability_zone[0]
  key_name = module.key_name.key_name
  subnet_id = module.subnet.subnet_id
}