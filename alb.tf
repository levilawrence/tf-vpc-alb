resource "aws_lb" "webservers" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.webservers.id]
  subnets            = [for subnet in aws_subnet.public_subnet : subnet.id]

  tags = {
    Name = "tf_alb"
  }
}

resource "aws_lb_listener" "webservers" {
  load_balancer_arn = aws_lb.webservers.arn
  port              = "80"
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webservers.arn
  }
}

resource "aws_lb_target_group" "webservers" {
  vpc_id = aws_vpc.tf_vpc.id

  deregistration_delay          = "300"
  load_balancing_algorithm_type = "round_robin"
  name                          = "webservers"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  slow_start                    = 0
  tags                          = {}
  tags_all = {
    "Managed_By" = "Terraform"
    "Owner"      = "Levi"
  }
  target_type = "instance"

  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  stickiness {
    cookie_duration = 86400
    enabled         = false
    type            = "lb_cookie"
  }
}

resource "aws_lb_target_group_attachment" "webservers" {
  count = length(aws_instance.webservers.*.id)

  target_group_arn = aws_lb_target_group.webservers.arn
  target_id        = aws_instance.webservers[count.index].id
  port             = 80
}

output "elb_dns_name" {
  value = aws_lb.webservers.dns_name
}
