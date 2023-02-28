variable "password_length" {
  default = 32
  type    = number
}

variable "mount_path" {
  type = string
}

variable "secret_name" {
  type = string
}

variable "additional_data" {
  type    = map(any)
  default = {}
}
