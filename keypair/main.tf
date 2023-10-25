resource "tls_private_key" "default" {
  algorithm = var.ssh_key_algorithm
}

resource "aws_key_pair" "generated" {
  depends_on = [tls_private_key.default]
  key_name   = var.key_name
  public_key = tls_private_key.default.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.default.private_key_pem}' > ./${var.key_name}.pem && chmod 400 ${var.key_name}.pem"
  }
}

resource "aws_ssm_parameter" "private_key_pem" {
  name  = substr("${var.key_name}-private_key_pem", 0, 255)
  type  = "SecureString"
  value = tls_private_key.default.private_key_pem
  tags = merge(tomap({
    "Terraform" = "true"
  }), var.tags)
}

resource "aws_ssm_parameter" "public_key_openssh" {
  name  = substr("${var.key_name}-public_key_openssh", 0, 255)
  type  = "String"
  value = tls_private_key.default.public_key_openssh
  tags  = var.tags
}
