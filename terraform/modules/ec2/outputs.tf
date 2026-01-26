output "instance_id" {
  value = aws_instance.ec2.id
}
output "bastion_ec2_ip" {
  value = aws_instance.bastion.public_ip
}
output "private_ec2_ip" {
  value = aws_instance.ec2.private_ip
}