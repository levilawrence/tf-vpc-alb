# # Create a new load balancer
# resource "aws_elb" "tf_elb" {
#   name               = "tf-elb"
# #   availability_zones = var.azs
#   subnets       = aws_subnet.public_subnet.*.id
#   security_groups = [aws_security_group.webservers.id]

# #   access_logs {
# #     bucket        = "foo"
# #     bucket_prefix = "bar"
# #     interval      = 60
# #   }

#   listener {
#     instance_port     = 80 
#     instance_protocol = "http"
#     lb_port           = 80
#     lb_protocol       = "http"
#   }

#   health_check {
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 3
#     target              = "HTTP:80/"
#     interval            = 30
#   }

#   instances                   = "${aws_instance.tf_web.*.id}"
#   cross_zone_load_balancing   = true
#   idle_timeout                = 400
#   connection_draining         = true
#   connection_draining_timeout = 400

#   tags = {
#     Name = "tf_elb"
#   }
# }

# output "elb_dns_name" {
#     value = "${aws_elb.tf_elb.dns_name}"
# }
