# variables.tf
variable "network_name" {
  description = "The name of the VPC network"
  default     = "my-network"
}

variable "subnet_name" {
  description = "The name of the subnet"
  default     = "my-subnet"
}

variable "nat_ip_name" {
  description = "The name of the external IP for NAT"
  default     = "my-nat-ip"
}
