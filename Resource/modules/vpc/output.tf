output "vpc_tiger_out" {
  value = aws_vpc.tiger_vpc.id
}

output "subnet_tiger_out" {
    value = aws_subnet.tiger_subnet.*.id
}
