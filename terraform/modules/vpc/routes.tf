#------------------------------#
# Public route table (wspólna) #
#------------------------------#
# Oba public subnety kierują ruch na IGW.
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    gateway_id = aws_internet_gateway.gateway.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "devops-public-rt"
  }
}

resource "aws_route_table_association" "public_association_a" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet_a.id
}

resource "aws_route_table_association" "public_association_b" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet_b.id
}

#--------------------------#
# Private route table AZ-a #
#--------------------------#
# Private subnet AZ-a --> NAT AZ-a.
resource "aws_route_table" "private_route_table_a" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_a.id
  }

  tags = {
    Name = "devops-private-rt-a"
  }
}

resource "aws_route_table_association" "private_association_a" {
  route_table_id = aws_route_table.private_route_table_a.id
  subnet_id      = aws_subnet.private_subnet_a.id
}

#--------------------------#
# Private route table AZ-b #
#--------------------------#
# Private subnet AZ-b --> NAT AZ-b.
resource "aws_route_table" "private_route_table_b" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_b.id
  }

  tags = {
    Name = "devops-private-rt-b"
  }
}

resource "aws_route_table_association" "private_association_b" {
  route_table_id = aws_route_table.private_route_table_b.id
  subnet_id      = aws_subnet.private_subnet_b.id
}