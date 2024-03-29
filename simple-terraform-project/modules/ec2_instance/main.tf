# Create EC2 Instance
resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  count = var.count_instance
  availability_zone = var.availability_zone
  
  tags = {
    Name  = "terraform-server-${count.index}"
  }
}