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

resource "aws_route_table_association" "route_associate_public_subnet" {
  subnet_id      = var.mv_subnet_id
  route_table_id = aws_route_table.route_table.id
}