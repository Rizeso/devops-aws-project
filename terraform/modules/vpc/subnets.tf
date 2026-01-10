resource "aws_subnet" "public_subnet " {
  description = "Public subnet for devops project"
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.vpc_public_cidr
  availability_zone = "${var.vpc_az}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "devops-public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  description = "Private subnet for devops project"
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.vpc_private_cidr
  availability_zone = "${var.vpc_az}a"

  tags = {
    Name = "devops-private-subnet"
  }
}