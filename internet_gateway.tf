#  add Internet Gateway to VPC
resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = "vpc_igw"
  }
}