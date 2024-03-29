module "security_group" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/security_groups"
}

module "key_name" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/key_name"
}

module "subnet" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/subnet"
}


# Create EC2 Instance
resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  count = var.count_instance
  vpc_security_group_ids = [ module.security_group.sg ]
  availability_zone = var.availability_zone
  key_name = module.key_name.key_name
  subnet_id = module.subnet.subnet_id
  
  
  tags = {
    Name  = "terraform-server-${count.index}"
  }
}