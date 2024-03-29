module "vpc" {
  source = "/home/princepazol/devops/simple-terraform-project/modules/vpc"
}

# Create security groups
resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id = module.vpc.vpc_id
  

  tags = {
    Name = "allow ssh traffic"
  }
}

# Open SSH port in security group
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_traffic" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 22
  ip_protocol = "tcp"
  to_port = 22
}