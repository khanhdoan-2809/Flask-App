resource "aws_ecr_repository" "flask_app" {
  name = var.mv_ecr_repository_name
}