variable "name" {
  type = string
}

variable "cidr" {
  type = string
}

variable "sec-grp-id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}
