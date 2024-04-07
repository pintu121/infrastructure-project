# VPC
resource "aws_vpc" "tiger_vpc" {
    cidr_block = var.tiger_vpc
    enable_dns_hostnames = true

    tags = {
      Name = "Tiger VpC"
    }
}

# Subnets
resource "aws_subnet" "tiger_subnet" {
    count = length(var.tiger_subnet)
    vpc_id = aws_vpc.tiger_vpc.id
    cidr_block = var.tiger_subnet[count.index]
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.available.names[count.index]

    tags = {
      Name = var.subnet_names[count.index]
    }
}

# Internet Gateway
resource "aws_internet_gateway" "tiger_igw" {
    vpc_id = aws_vpc.tiger_vpc.id

    tags = {
      Name = "Tiger_igw"
    }
  
}

# Route Table
resource "aws_route_table" "tiger_rt" {
    vpc_id = aws_vpc.tiger_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tiger_igw.id
    }

    tags = {
        Name = "Tiger_RT"
    }  
}

# Route Table Association
resource "aws_route_table_association" "tiger_rta" {
    count = length(var.tiger_subnet)
    subnet_id = aws_subnet.tiger_subnet[count.index].id
    route_table_id = aws_route_table.tiger_rt.id
}