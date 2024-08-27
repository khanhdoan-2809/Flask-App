# ecr
lv_ecr_repository_name = "flask-app"

# vpc
lv_vpc_cidr_block = "10.0.0.0/16"
lv_vpc_name       = "Flask App VPC"

# internet gateway
lv_igw_name = "Flask App VPC - Internet Gateway"

# routable
lv_route_table_name     = "Public Subnet Route Table"
lv_route_destination    = "0.0.0.0/0"

# ecs
lv_ecs_cluster_name = "my-cluster" 

# elb
lv_application_load_balancer_name = "application-load-balancer"