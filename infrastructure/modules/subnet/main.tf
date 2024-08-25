resource "aws_subnet" "main" {
  availability_zone       = var.mv_availability_zone
  vpc_id                  = var.mv_vpc_id
  cidr_block              = var.mv_cidr_block
  tags = {
    Name = var.mv_subnet_name
  }
}