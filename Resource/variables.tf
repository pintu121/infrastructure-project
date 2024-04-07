variable "tiger_vpc" {
  description = "VPC CIDR"
  type        = string
}

variable "tiger_subnet" {
  description = "Subnet CIDR"
  type        = list(string)
}

variable "subnet_names" {
  description = "Subnet Names"
  type        = list(string)
}

variable "ami" {
  description = "Image For Instance"
  type        = string
}
variable "instances" {
  description = "Instance Types"
  type        = string
}
variable "instance_name" {
  description = "Instance Name"
  type        = list(string)
}
