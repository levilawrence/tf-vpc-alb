# create EC2 instance
resource "aws_instance" "webservers" {
  count = var.number_of_instances

  ami           = var.ami_id
  instance_type = var.instance_type

  security_groups = [aws_security_group.webservers.id]
  subnet_id       = element(aws_subnet.public_subnet.*.id, count.index)
  key_name        = var.key
  user_data       = base64encode(data.template_file.user_data[count.index].rendered)

  tags = {
    Name = "webservers_${count.index}"
  }
}
