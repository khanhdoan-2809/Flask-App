# vpc
variable "lv_vpc_cidr_block" {
  type    = string
}

variable "lv_vpc_name" {
  type    = string
}

# route table
variable "lv_route_table_name" {
  type    = string
}

variable "lv_route_destination" {
  type = string
}

# internet gateway
variable "lv_igw_name" {
  type    = string
}

# ecr
variable "lv_ecr_repository_name" {
  type = string
}

# ecs
variable "lv_ecs_service_name" {
  type = string
}

variable "lv_ecs_cluster_name" {
  type = string
}

# ELB
variable "lv_application_load_balancer_name" {
  type = string
}