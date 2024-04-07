variable "sg_tiger_out" {
    description = "SG For LB"
    type = string
}
variable "subnet_tiger_out" {
    description = "Subnet For LB"
    type = list(string)
}

variable "vpc_tiger_out" {
    description = "VPC For Listener"
    type = string
}
variable "ec2_tiger_out" {
    description = "Ec2 For LB"
    type = string
  
}