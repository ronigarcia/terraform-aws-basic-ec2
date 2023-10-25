resource "aws_security_group" "allow_ssh" {
  name        = "allow-${var.name}"
  description = "permitir_ssh"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH to EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}


resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  subnet_id                   = var.subnet
  key_name                    = var.keypair
  associate_public_ip_address = var.associate_public_ip_address
  tags                        = var.tags
}

