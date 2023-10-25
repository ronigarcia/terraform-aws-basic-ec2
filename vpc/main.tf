resource "aws_vpc" "main" {
  cidr_block           = var.cidrBlock
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = var.tags
}

#Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}

#NAT Gateway

resource "aws_eip" "natgw" {
  depends_on = [aws_internet_gateway.igw]
  domain     = "vpc"
  tags = {
    Name = "ElasticIP-NatGw"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.natgw.id
  subnet_id     = aws_subnet.publicSubnet[0].id

  tags = {
    Name = "${var.vpc_name}-NatGw"
  }
}

resource "aws_subnet" "publicSubnet" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = lookup(var.public_subnets[count.index], "subnet")
  map_public_ip_on_launch = true
  availability_zone       = lookup(var.public_subnets[count.index], "availability_zone")

  tags = {
    Name = "${var.public_subnet_name} - ${lookup(var.public_subnets[count.index], "availability_zone")}"
    Tier = "public"
  }
}

resource "aws_subnet" "privateSubnet" {
  count                   = length(var.private_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = lookup(var.private_subnets[count.index], "subnet")
  map_public_ip_on_launch = false
  availability_zone       = lookup(var.private_subnets[count.index], "availability_zone")

  tags = {
    Name = "${var.private_subnet_name} - ${lookup(var.private_subnets[count.index], "availability_zone")}"
    Tier = "private"
  }

}