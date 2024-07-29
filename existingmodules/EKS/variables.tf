variable "vpc_cidr" {
  type = string
  description = "vpc cidr range"
}

variable "public_subnets" {
  type = list(string)
  description = "public subnet cidr range"
}

variable "private_subnets" {
  type = list(string)
  description = "private subnet cidr range"
}