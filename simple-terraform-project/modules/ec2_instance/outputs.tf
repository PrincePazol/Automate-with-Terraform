output "subnet_id" {
  value = module.subnet.subnet_id
}

output "private_ip" {
  value = aws_instance.web[*].private_ip
}