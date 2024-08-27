resource "aws_alb" "application_load_balancer" {
    name                = var.mv_application_load_balancer_name
    load_balancer_type  = "application"
    subnets             = var.mv_subnet_ids

    security_groups     = var.mv_security_groups
}

resource "aws_lb_target_group" "target_group" {
    name        = "target-group"
    port        = 80
    protocol    = "HTTP"
    target_type = "ip"
    vpc_id      = var.mv_vpc_id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = "${aws_alb.application_load_balancer.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.target_group.arn}"
  }
}