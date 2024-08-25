resource "aws_route_table" "route_table" {
  vpc_id = var.mv_vpc_id

  route {
    cidr_block = var.mv_route_destination
    gateway_id = var.mv_internet_gateway_id
  }

  tags = {
    Name = var.mv_route_table_name
  }
}