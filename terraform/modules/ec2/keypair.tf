resource "aws_key_pair" "public_key" {
  key_name   = "devops-public-key"
  public_key = var.ssh_public_key
}