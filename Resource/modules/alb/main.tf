# ALB
resource "aws_lb" "alb_tiger" {
  name               = "alb-tiger"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_tiger_out]
  subnets            = var.subnet_tiger_out

  tags = {
    Name = "ALB Tiger"
  }
}
# Listener
resource "aws_lb_listener" "lb-listener_tiger" {
  load_balancer_arn = aws_lb.alb_tiger.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_tiger.arn
  }
  tags = {
    Name = "LB Listener"
  }
}

# Traget Group 
resource "aws_lb_target_group" "tg_tiger" {
  name     = "lb-tg-tiger"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_tiger_out

  tags = {
    Name = "TG Tiger"
  }
}

# Traget Group Attachment
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.tg_tiger.arn
  target_id        = var.ec2_tiger_out
  port             = 80
}