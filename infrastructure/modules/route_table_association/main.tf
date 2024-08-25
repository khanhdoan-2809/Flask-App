resource "aws_route_table_association" "route_associate_public_subnet" {
  subnet_id       = var.mv_subnet_id
  route_table_id  = var.mv_route_table_id
}