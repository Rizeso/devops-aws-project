resource "aws_instance" "ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = []
  associate_public_ip_address = true

  tags = {
    Name = "public-ec2"
  }
}