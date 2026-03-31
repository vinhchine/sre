resource "aws_lb" "alb" {
  load_balancer_type = "application"
  subnets            = [
    aws_subnet.subnet_1.id,
    aws_subnet.subnet_2.id
  ]
}

resource "aws_lb_target_group" "tg" {
  port     = 5000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  target_type = "ip" 
  health_check {
    path = "/health"
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port = 80

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}