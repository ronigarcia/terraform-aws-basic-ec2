## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.21.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.21.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.natgw](https://registry.terraform.io/providers/hashicorp/aws/5.21.0/docs/resources/eip) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/5.21.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gw](https://registry.terraform.io/providers/hashicorp/aws/5.21.0/docs/resources/nat_gateway) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/5.21.0/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/5.21.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_rt_assoc_routes](https://registry.terraform.io/providers/hashicorp/aws/5.21.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/5.21.0/docs/resources/route_table_association) | resource |
| [aws_subnet.privateSubnet](https://registry.terraform.io/providers/hashicorp/aws/5.21.0/docs/resources/subnet) | resource |
| [aws_subnet.publicSubnet](https://registry.terraform.io/providers/hashicorp/aws/5.21.0/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/5.21.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidrBlock"></a> [cidrBlock](#input\_cidrBlock) | [OBRIGATÓRIO] Endereço do bloco cidr ipv4 que será usado pelo VPC | `string` | n/a | yes |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | [OPCIONAL] Definir se a VPC terá suporte a DNS hostnames [DEFAULT:true] | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | [OPCIONAL] Definir se a VPC terá suporte a DNS [DEFAULT:true] | `bool` | `true` | no |
| <a name="input_private_rt_name"></a> [private\_rt\_name](#input\_private\_rt\_name) | Nome que será dado as route tables privadas | `string` | `"Private Route Table"` | no |
| <a name="input_private_subnet_name"></a> [private\_subnet\_name](#input\_private\_subnet\_name) | Nome que será dado as subnets privadas | `string` | `"Private Subnet"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | [OBRIGATÓRIO] Lista com os blocos de endereços para as subredes privadas | `list(map(string))` | n/a | yes |
| <a name="input_public_rt_name"></a> [public\_rt\_name](#input\_public\_rt\_name) | Nome que será dado a route table pública | `string` | `"Public Route Table"` | no |
| <a name="input_public_subnet_name"></a> [public\_subnet\_name](#input\_public\_subnet\_name) | Nome que será dado as subnets públicas | `string` | `"Public Subnet"` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | [OBRIGATÓRIO] Lista com os blocos de endereços para as subredes públicas | `list(map(string))` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags | `map(string)` | `{}` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | [OBRIGATÓRIO] Nome a ser dado ao VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | Output do id do vpc |
