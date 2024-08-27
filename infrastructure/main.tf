#####################
# ECR
#####################
module "ecr" {
  source                  = "./modules/ecr"
  mv_ecr_repository_name  = var.lv_ecr_repository_name
}

#####################
# VPC
#####################
module "vpc" {
  source            = "./modules/vpc"
  mv_vpc_name       = var.lv_vpc_name
  mv_vpc_cidr_block = var.lv_vpc_cidr_block
}

#####################
# Subnet
#####################
module "public_subnet_a" {
  source                = "./modules/subnet"
  mv_availability_zone  = "ap-southeast-1a"
  mv_vpc_id             = module.vpc.id
  mv_cidr_block         = "10.0.0.0/24"
  mv_subnet_name        = "Public Subnet A"
}

module "public_subnet_b" {
  source                = "./modules/subnet"
  mv_availability_zone  = "ap-southeast-1b"
  mv_vpc_id             = module.vpc.id
  mv_cidr_block         = "10.0.1.0/24"
  mv_subnet_name        = "Public Subnet B"
}

module "public_subnet_c" {
  source                = "./modules/subnet"
  mv_availability_zone  = "ap-southeast-1c"
  mv_vpc_id             = module.vpc.id
  mv_cidr_block         = "10.0.2.0/24"
  mv_subnet_name        = "Public Subnet C"
}

#####################
# Internet Gateway
#####################
module "igw" {
  source                = "./modules/igw"
  mv_igw_name           = var.lv_igw_name
  mv_vpc_id             = module.vpc.id
}

#####################
# Route Table
#####################
module "route_table" {
  source                  = "./modules/route_table"
  mv_route_destination    = var.lv_route_destination
  mv_internet_gateway_id  = module.igw.id
  mv_route_table_name     = var.lv_route_table_name
  mv_vpc_id               = module.vpc.id
}

module "route_table_public_subnet_a" {
  source                  = "./modules/route_table_association"
  mv_route_table_id       = module.route_table.id
  mv_subnet_id            = module.public_subnet_a.id
}

module "route_table_public_subnet_b" {
  source                  = "./modules/route_table_association"
  mv_route_table_id       = module.route_table.id
  mv_subnet_id            = module.public_subnet_b.id
}

module "route_table_public_subnet_c" {
  source                  = "./modules/route_table_association"
  mv_route_table_id       = module.route_table.id
  mv_subnet_id            = module.public_subnet_c.id
}

#####################
# ECS
#####################
module "ecs" {
  source                  = "./modules/ecs"
  mv_ecr_repository_name  = var.lv_ecr_repository_name
  mv_ecs_cluster_name  = var.lv_ecs_cluster_name 
}