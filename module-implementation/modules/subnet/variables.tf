variable "cidr_block" {
  default = "10.0.0.0/24"
  description = "Specifies the cidr block"
}

variable "availability_zone" {
  description = "Specifies an AZ"
  default = "us-east-1a"
}