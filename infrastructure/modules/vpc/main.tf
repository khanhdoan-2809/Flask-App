resource "aws_vpc" "main" {
  cidr_block = var.mv_vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = var.mv_vpc_name
  }
}