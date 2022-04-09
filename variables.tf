# VPC
variable "aws_region" {
  default = "eu-west-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

# subnet
variable "azs" {
  type    = list(any)
  default = ["eu-west-2a", "eu-west-2b"]
}

variable "subnet_cidr" {
  type    = list(any)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

# EC2
variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-03e88be9ecff64781"
}

variable "number_of_instances" {
  default = 6
}

# key pair
variable "key" {
  default = "chapter3"
}