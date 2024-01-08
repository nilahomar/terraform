variable "private_subnets" {
  default = ["192.168.128.0/18", "192.168.192.0/18"]
}

variable "public_subnets" {
  default = ["192.168.0.0/18", "192.168.64.0/18"]
}
