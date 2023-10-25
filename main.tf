module "vpc" {
  source = "./vpc"

  cidrBlock = var.vpc_cidrBlock

  vpc_name = var.vpn_name

  public_subnets = [
    {
      subnet            = var.public_subnets_cidrBlock
      availability_zone = "${var.aws_region}a"
    }
  ]

  private_subnets = [
    {
      subnet            = var.private_subnets_cidrBlock
      availability_zone = "${var.aws_region}a"
    }
  ]

  tags = merge(
    {
      Name = var.vpn_name
    },
    var.tags
  )

}

module "keypair" {
  source   = "./keypair"
  key_name = var.key_name
  tags = merge(
    {
      Name = "${var.name}-keypair"
    },
    var.tags
  )
}

module "ec2_public" {
  source        = "./ec2"
  name          = "ec2-public"
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet        = module.vpc.subnet_ids.public[0]
  keypair       = module.keypair.key_name
  vpc_id        = module.vpc.vpc_id
  tags = merge(
    {
      Name = "${var.name}-ec2-public"
    },
    var.tags
  )
}

module "ec2_private" {
  source        = "./ec2"
  name          = "ec2-private"
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet        = module.vpc.subnet_ids.private[0]
  keypair       = module.keypair.key_name
  vpc_id        = module.vpc.vpc_id
  tags = merge(
    {
      Name = "${var.name}-ec2-private"
    },
    var.tags
  )
}

resource "aws_ec2_instance_connect_endpoint" "this" {
  subnet_id          = module.vpc.subnet_ids.private[0]
  security_group_ids = [module.ec2_private.security_group_id]
  tags = merge(
    {
      Name = "${var.name}-ec2-connect-endpoint"
    },
    var.tags
  )
}