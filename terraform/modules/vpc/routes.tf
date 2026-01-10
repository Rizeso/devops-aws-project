  ###############
  #Public routes#
  ###############
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "devops-public-route-table"
  }
}

resource "aws_route" "public_route" {
  route_table_id = aws_route_table.public_route_table.id
  gateway_id = aws_internet_gateway.gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public_association" {
  route_table_id = aws_route_table.public_route_table.id
  sunbet_id = aws_subnet.public_subnet.id
}

  ################
  #Private routes#
  ################
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "devops_private_route_table"
  }
}

resource "aws_route" "private_route" {
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_association" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id = aws_subnet.private_subnet.id
}