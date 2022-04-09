#  add public subnet
resource "aws_subnet" "public_subnet" {
  count = length(data.aws_availability_zones.available.names)

  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = cidrsubnet("${var.vpc_cidr}", 8, count.index)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet ${element(data.aws_availability_zones.available.names, count.index)}"
  }
}
