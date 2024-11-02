resource "aws_instance" "web" {
    count = length(var.instance_name)
    ami           = var.ami
    instance_type = var.instances
    subnet_id = var.subnet_tiger_out[count.index]
    key_name = "my-key"
    associate_public_ip_address = true
    security_groups = var.subnet_tiger_out
    availability_zone = data.aws_availability_zones.available.names[count.index]

    user_data = <<-EOF
                #!/bin/bash
                apt-get update -y
                apt-get install nginx -y
                service nginx start
                EOF

    tags = {
        Name = "var.instances[count.index]"
    }
}