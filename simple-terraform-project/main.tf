module "key_name" {
  source = "./modules/key_name"
}

module "subnet" {
  source = "./modules/subnet"
}

module "security_group" {
  source = "./modules/security_groups"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami = var.ami[0]
  instance_type = var.instance_type[0]
  availability_zone = var.availability_zone[0]
  key_name = module.key_name.key_name
  subnet_id = module.subnet.subnet_id
}