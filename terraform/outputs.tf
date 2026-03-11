output "instance_id" {
  value = module.ec2.instance_id
}
output "bastion_ec2_ip" {
  value = module.ec2.bastion_ec2_ip
}
output "private_ec2_ip" {
  value = module.ec2.private_ec2_ip
}