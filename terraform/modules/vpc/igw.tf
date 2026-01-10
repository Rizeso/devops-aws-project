resource "aws_internet_gateway" "gateway" {
  description = "Internet gateway for devops project"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "devops-igw"
  }
}