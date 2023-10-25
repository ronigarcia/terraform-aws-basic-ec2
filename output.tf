output "ec2_private_ip" {
  value = module.ec2_private.ec2_private_ip
}

output "ec2_private_id" {
  value = module.ec2_private.ec2_id
}

output "ec2_public_ip" {
  value = module.ec2_public.ec2_public_ip
}

output "key_name" {
  value = module.keypair.key_name
}
