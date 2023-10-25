output "vpc_id" {
  value       = aws_vpc.main.id
  description = "Output do id do vpc"
}

output "subnet_ids" {
  value = { public = aws_subnet.publicSubnet.*.id,
  private = aws_subnet.privateSubnet.*.id }
}
