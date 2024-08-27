variable "mv_application_load_balancer_name" {
  type = string
}

variable "mv_subnet_ids" {
  type = list(string)
}

variable "mv_security_groups" {
  type = list(string)
}

variable "mv_vpc_id" {
  type = string
}