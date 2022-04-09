data "template_file" "user_data" {
  count    = var.number_of_instances
  template = <<EOF
    #!/bin/bash
        yum install httpd -y
        echo "hello freak bitches ${count.index}" > /var/www/html/index.html
        service httpd start
        chkconfig httpd on
        EOF
}

data "aws_availability_zones" "available" {
  state = "available"
}

