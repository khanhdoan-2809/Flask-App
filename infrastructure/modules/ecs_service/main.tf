resource "aws_ecs_service" "my_first_service" {
    name            = var.mv_ecs_service_name
    cluster         = var.mv_ecs_cluster_name
    task_definition = var.mv_ecs_task_defiition
    launch_type     = "FARGATE"
    desired_count   = 3

    load_balancer {
      target_group_arn  = var.mv_target_group_arn
      container_name    = var.mv_task_family
      container_port    = 5000
    }

    network_configuration {
      subnets           = var.mv_subnet_ids
      assign_public_ip  = true
      security_groups   = ["${aws_security_group.service_security_group.id}"]
    }
}

resource "aws_security_group" "service_security_group" {
  vpc_id      = var.mv_vpc_id
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # Only allowing traffic in from the load balancer security group
    security_groups = var.mv_load_balancer_security_group
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
