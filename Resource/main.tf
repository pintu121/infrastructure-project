module "vpc" {
    source = "./modules/vpc"
    tiger_vpc = var.tiger_vpc
    tiger_subnet = var.tiger_subnet
    subnet_names = var.subnet_names
}
# module "sg" {
#     source = "./modules/sg"
#     vpc_tiger_out = module.vpc.vpc_tiger_out
  
# }

# module "ec2" {
#     source = "./modules/ec2"
#     instance_name = var.instance_name
#     sg_tiger_out = module.sg.sg_tiger_out
#     subnet_tiger_out = module.vpc.subnet_tiger_out
#     ami = var.ami
#     instances = var.instances
# }
# module "alb" {
#     source = "./modules/alb"
#     vpc_tiger_out = module.vpc.vpc_tiger_out
#     ec2_tiger_out = module.ec2.ec2_tiger_out
#     subnet_tiger_out = module.vpc.subnet_tiger_out
#     sg_tiger_out = module.sg.sg_tiger_out
# }