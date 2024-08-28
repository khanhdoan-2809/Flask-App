output "app_url" {
  value = aws_alb.application_load_balancer.dns_name
}

output "target_group_arn" {
    value = aws_lb_target_group.target_group.arn
}