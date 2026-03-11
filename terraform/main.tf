####################
# Import modulu VPC#
####################
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr         = "10.0.0.0/16"
  vpc_public_cidr  = "10.0.10.0/24"
  vpc_private_cidr = "10.0.20.0/24"
}

####################
# Import modulu ec2#
####################
module "ec2" {
  source = "./modules/ec2"

  vpc_id         = module.vpc.vpc_id
  priv_subnet_id = module.vpc.private_subnet_id
  pub_subnet_id  = module.vpc.public_subnet_id

  # ssh_public_key = var.ssh_public_key
  #
  # project    = var.project
  # environmet = var.environment
  # managed_by = var.managed_by
}


