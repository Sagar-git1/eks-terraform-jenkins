variable "jen-vpc-cidr" {
  type = string
  description = "creating vpc for creating jenkins server with cidr"
}

variable "region" {
  type = string
  description = "vpc region"
}

variable "instance_type" {
  type = string
  description = "ec2-instance type"
}