variable "availability_zone" {
  description = "Specifies the availability zone"
}

variable "ami" {
  description = "Specifies the AMI Image"
}

variable "instance_type" {
  description = "Specifies instance type"
}

variable "count_instance" {
  type = number
  description = "Specifies the number of servers to create"
  default = 2
}

variable "subnet_id" {
  description = "Specifies subnet"
}

# variable "security_groups" {
#   description = "Specifies security group"
# }

variable "key_name" {
  description = "Specifies key name"
}

# variable "cidr_ipv4" {
#   description = "specifies a cidr block"
# }