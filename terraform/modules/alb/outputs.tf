output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "alb_sg_id" {
  value = aws_security_group.sg_alb.id
}

# ALB TG
output "alb_tg_arn" {
  value = aws_lb_target_group.app_tg.arn
}

output "target_group_arn" {
  value       = aws_lb_target_group.app_tg.arn
}