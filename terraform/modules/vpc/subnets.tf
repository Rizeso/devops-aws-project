################
# AZ-a subnets #
################
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.vpc_private_cidr_a
  availability_zone       = "${var.vpc_az}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "devops-public-subnet-a"
  }
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_private_cidr_a
  availability_zone = "${var.vpc_az}a"

  tags = {
    Name = "devops-private-subnet-a"
  }
}

################
# AZ-B subnets #
################
resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.vpc_public_cidr_b
  availability_zone       = "${var.vpc_az}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "devops-public-subnet-b"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_private_cidr_b
  availability_zone = "${var.vpc_az}b"

  tags = {
    Name = "devops-private-subnet-b"
  }
}