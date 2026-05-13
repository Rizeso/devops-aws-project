#----------------------#
# NAT gateway for AZ-A #
#----------------------#

# Elastic IP
resource "aws_eip" "nat_eip_a" {
  domain = "vpc"

  tags = {
    Name = "devops-nat-gw-eip_a"
  }

}
# NAT
resource "aws_nat_gateway" "nat_gw_a" {
  allocation_id = aws_eip.nat_eip_a.id
  subnet_id     = aws_subnet.public_subnet_a.id

  tags = {
    Name = "devops-nat-gw_a"
  }

  #Tworzenie NAT dopiero, gdy istnieje IGW
  depends_on = [aws_internet_gateway.gateway]
}

#----------------------#
# NAT gateway for AZ-B #
#----------------------#

# Elastic IP
resource "aws_eip" "nat_eip_b" {
  domain = "vpc"

  tags = {
    Name = "devops-nat-gw-eip_b"
  }

}
# NAT
resource "aws_nat_gateway" "nat_gw_b" {
  allocation_id = aws_eip.nat_eip_b.id
  subnet_id     = aws_subnet.public_subnet_b.id

  tags = {
    Name = "devops-nat-gw_b"
  }

  #Tworzenie NAT dopiero, gdy istnieje IGW
  depends_on = [aws_internet_gateway.gateway]
}