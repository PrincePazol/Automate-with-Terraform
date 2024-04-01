module "key_name" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/key_name"
}

module "subnet" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/subnet"
}

module "vpc" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/vpc"
}

# Create security groups
resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id = module.vpc.vpc_id
}
  
# Open SSH port in security group
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_traffic" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 22
  ip_protocol = "tcp"
  to_port = 22
}

resource "aws_vpc_security_group_egress_rule" "all_traffic" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}

# Create public subnet
resource "aws_subnet" "main-subnet" {
  vpc_id = module.vpc.vpc_id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "main-subnet"
  }
}

resource "aws_instance" "forwarder" {
  ami = var.ami[0]
  instance_type = var.instance_type[0]
  availability_zone = var.availability_zone[0]
  key_name = module.key_name.key_name
  subnet_id = aws_subnet.main-subnet.id
  count = 1
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]

  tags = {
    Name = "terraform-server-${count.index}"
  }
}