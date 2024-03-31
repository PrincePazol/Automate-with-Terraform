variable "cidr" {
  description = "Specifies cidr blocks"
  default = [ "10.0.0.0/16" ]
  type = list(string)
}

variable "availability_zone" {
  description = "Specifies the AZ"
  default = [ "us-east-1a" ]
  type = list(string)
}

variable "ami" {
  description = "Specifies AWS AMI"
  default = [ "ami-080e1f13689e07408" ]
  type = list(string)
}

variable "instance_type" {
  description = "Specifies the instance type"
  default = [ "t2.micro" ]
  type = list(string)
}