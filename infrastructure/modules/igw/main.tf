resource "aws_internet_gateway" "gw" {
  vpc_id = var.mv_vpc_id

  tags = {
    Name = var.mv_igw_name
  }
}