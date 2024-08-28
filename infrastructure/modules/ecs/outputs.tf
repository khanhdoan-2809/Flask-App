output "ecs_cluster_name" {
  value = aws_ecs_cluster.my_cluster.name
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.flask_app_task.arn
}

output "ecs_task_definition_family" {
  value = aws_ecs_task_definition.flask_app_task.family
}