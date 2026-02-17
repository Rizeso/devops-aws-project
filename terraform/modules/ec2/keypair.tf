resource "aws_key_pair" "public_key" {
  key_name   = "devops-public-key"
  public_key = file("~/.ssh/devops-ec2.pub")
}