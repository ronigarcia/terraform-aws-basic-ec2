data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# data "aws_subnet_ids" "subnets_private" {
#   vpc_id = data.aws_vpc.default.id
#   filter {
#     name   = "tag:Tier"
#     values = ["private"]
#   }
# }

# data "aws_subnet_ids" "subnets_public" {
#   vpc_id = data.aws_vpc.default.id
#   filter {
#     name   = "tag:Tier"
#     values = ["public"]
#   }
# }