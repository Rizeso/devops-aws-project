resource "aws_security_group" "sg_priv_ec2" {
  name = "sg-priv-ec2"
  vpc_id = var.vpc_id.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [aws_security_group.sg_bastion.id]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [0.0.0.0/0]
  }

  tags = {
    Name = "devops-sg-priv-ec2"
  }
}