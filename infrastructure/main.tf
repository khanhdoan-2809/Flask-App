module "ecr" {
  source = "./ecr"
  mv_ecr_repository_name = var.lv_ecr_repository_name
}