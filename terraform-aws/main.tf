# Create AWS VPC
resource "aws_vpc" "vpc-1" {
  cidr_block = var.cidr[0]

  tags = {
    Name = "main-terraform"
  }
}

# Create AWS Subnet
resource "aws_subnet" "subnet-1" {
  vpc_id = aws_vpc.vpc-1.id
  cidr_block = var.cidr[1]
  availability_zone = var.availability_zone[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "main-terraform"
  }
}

# Create AWS Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc-1.id

  tags = {
    Name = "main-terraform"
  }
}

# Create AWS Route Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc-1.id

  route {
    cidr_block = var.cidr[2]
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "main-terraform"
  }
}

# Create AWS Route Table Association
resource "aws_route_table_association" "rta" {
  subnet_id = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.rt.id
}

# Create AWS Security Group
resource "aws_security_group" "allow_tls" {
  name = "allow_tls"
  description = "Allow TLS inbound and all outbound traffic"
  vpc_id = aws_vpc.vpc-1.id

  tags = {
    Name = "main-terraform"
  }
}

# Configure the inbound security group rules
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4 = var.cidr[2]
  from_port = "22"
  to_port = "22"
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "splunk_web" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4 = var.cidr[2]
  from_port = "8000"
  to_port = "8000"
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "splunk_mgt" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4 = var.cidr[2]
  from_port = "8089"
  to_port = "8089"
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "splunk_receiving" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4 = var.cidr[2]
  from_port = "9997"
  to_port = "9997"
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "splunk_kv" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4 = var.cidr[2]
  from_port = "8191"
  to_port = "8191"
  ip_protocol = "tcp"
}

# Create Key Pair
resource "aws_key_pair" "terraform-deployer" {
  key_name = "terraform-deployer"
  public_key = file("/home/princepazol/devops/module-implementation/terraform-project.pub")

  tags = {
    Name = "main-terraform"
  }
}

# Create AWS EC2
resource "aws_instance" "terraform_ec2" {
  ami = var.ami[0]
  instance_type = var.instance_type[0]
  subnet_id = aws_subnet.subnet-1.id
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
  associate_public_ip_address = true
  availability_zone = var.availability_zone[0]
  key_name = aws_key_pair.terraform-deployer.key_name
  count = 1

  root_block_device {
    volume_size = 20
  }

  tags = {
    Name = "fowarder-${count.index}"
  }
}