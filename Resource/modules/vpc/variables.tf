variable "tiger_vpc" {
    description = "VPC CIDR"
    type = string
}

variable "tiger_subnet" {
    description = "Subnet CIDR"
    type = list(string)
}

variable "subnet_names" {
    description = "Subnet Names"
    type = list(string)
}
