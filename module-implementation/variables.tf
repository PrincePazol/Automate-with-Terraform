variable "cidr_block" {
  type = list(string)
  description = "Specifies the cidr block"
}

variable "availability_zone" {
  type = list(string)
  description = "Specifies the availability zone"
}

variable "ami" {
  type = list(string)
  description = "Specifies the AMI Image"
}

variable "instance_type" {
  type = list(string)
  description = "Specifies instance type"
}

variable "count_instance" {
  description = "Specifies the number of servers to create"
}