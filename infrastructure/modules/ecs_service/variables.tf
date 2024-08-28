#ecs 
variable "mv_ecs_service_name" {
  type = string
}

variable "mv_ecs_cluster_name" {
  type = string
}

variable "mv_ecs_task_defiition" {
  type = string
}

# load balancer
variable "mv_target_group_arn" {
    type = string
}

variable "mv_load_balancer_security_group" {
  type = list(string)
}

# ecs task definition
variable "mv_task_family" {
  type = string
}

# subnet
variable "mv_subnet_ids" {
  type = list(string)
}

# vpc
variable "mv_vpc_id" {
  type = string
}