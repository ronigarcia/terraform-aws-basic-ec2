resource "aws_route_table" "public" {
  depends_on = [aws_internet_gateway.igw]
  vpc_id     = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "route-public"
  }
}

resource "aws_route_table_association" "public" {
  depends_on     = [aws_subnet.publicSubnet, aws_route_table.public]
  count          = length(var.public_subnets)
  subnet_id      = element(aws_subnet.publicSubnet.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  count  = length(aws_subnet.privateSubnet.*.id)
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.nat_gw.*.id, count.index)
  }

  tags = {
    Name = "${var.private_rt_name} - ${lookup(var.private_subnets[count.index], "availability_zone")}"
    Tier = "private"
  }
}


resource "aws_route_table_association" "private_rt_assoc_routes" {
  depends_on     = [aws_subnet.privateSubnet, aws_route_table.private]
  count          = length(var.private_subnets)
  subnet_id      = element(aws_subnet.privateSubnet.*.id, count.index)
  route_table_id = aws_route_table.private[count.index].id
}

