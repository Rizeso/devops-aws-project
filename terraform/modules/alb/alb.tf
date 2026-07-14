resource "aws_lb" "app_alb" {
  name               = "devops-app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_alb.id]
  subnets            = var.public_subnet_ids

  tags = {
    Name = "devops-app-alb"
  }
}