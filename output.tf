output "ec2_private_arn" {
  value = module.ec2_private.ec2_arn
}

output "ec2_private_ip" {
  value = module.ec2_private.ec2_private_ip
}

output "ec2_public_arn" {
  value = module.ec2_public.ec2_arn
}

output "ec2_public_ip" {
  value = module.ec2_public.ec2_public_ip
}

output "key_name" {
  value = module.keypair.key_name
}

output "aws_ec2_instance_connect_endpoint_arn" {
  value = aws_ec2_instance_connect_endpoint.this.arn
}

output "aws_ec2_instance_connect_endpoint_dns" {
  value = aws_ec2_instance_connect_endpoint.this.dns_name
}