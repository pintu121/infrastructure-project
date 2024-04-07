variable "ami" {
    description = "Image For Instance"
    type = string
}

variable "instances" {
    description = "Instance Types"
    type = string
}
variable "instance_name" {
  description = "Instance Name"
  type = list(string)
}
variable "subnet_tiger_out" {
    description = "Subnet For ec2"
    type = list(string)
}
variable "sg_tiger_out" {
    description = "SG For Ec2"
    type = string
  
}
