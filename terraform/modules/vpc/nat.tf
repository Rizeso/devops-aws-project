################
## Elastic IP ##
################
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "devops-nat-gw-eip"
  }

}
#################
## NAT gateway ##
#################
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "devops-nat-gw"
  }

<<<<<<< HEAD
  #Tworzenie NAT dopiero, gdy istnieje IGW
=======
  #Tworzenie NAT wtedy, gdy IGW istnieje
>>>>>>> bf47b8b (Before terraform fmt)
  depends_on = [aws_internet_gateway.gateway]
}