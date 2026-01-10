    ## Elastic IP ##
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "devops-nat-gw-eip"
  }

}

    ## NAT gateway ##
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = "devops-nat-gateway"
  }
}