resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.pub_subnet_id
  key_name      = aws_key_pair.public_key.key_name
  vpc_security_group_ids = [
    aws_security_group.sg_bastion.id
  ]
  associate_public_ip_address = true

  tags = {
    Name = "bastion"
  }
}
resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.priv_subnet_id
  key_name      = aws_key_pair.public_key.key_name
  vpc_security_group_ids = [
    aws_security_group.sg_priv_ec2.id
  ]

  tags = {
    Name = "priv-ec2"
  }
}