output "private_ip" {
  value = aws_instance.forwarder.*.private_ip
}