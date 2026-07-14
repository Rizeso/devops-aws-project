#####################
# Import modulu VPC #
#####################
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr           = "10.0.0.0/16"
  vpc_public_cidr_a  = "10.0.10.0/24"
  vpc_private_cidr_a = "10.0.20.0/24"
  vpc_public_cidr_b  = "10.0.11.0/24"
  vpc_private_cidr_b = "10.0.21.0/24"
}

#####################
# Import modulu ec2 #
#####################
module "ec2" {
  source = "./modules/ec2"

  vpc_id         = module.vpc.vpc_id
  priv_subnet_id = module.vpc.private_subnet_id_a
  pub_subnet_id  = module.vpc.public_subnet_id_a
  alb_sg_id      = module.alb.alb_sg_id

  # ssh_public_key = var.ssh_public_key
  #
  # project    = var.project
  # environment = var.environment
  # managed_by = var.managed_by
}

#####################
# import modulu ALB #
#####################
module "alb" {
  source = "./modules/alb"

  vpc_id = module.vpc.vpc_id
  public_subnet_ids = [
    module.vpc.public_subnet_id_a,
    module.vpc.public_subnet_id_b
  ]
}

resource "aws_lb_target_group_attachment" "app_target" {
  target_group_arn = module.alb.target_group_arn
  target_id        = module.ec2.instance_id
  port             = 8000
}