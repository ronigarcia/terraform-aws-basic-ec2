### AWS Basic EC2


## Create env.tfvars

Before to execute terraform, you should change the `env.tfvars` inputs.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan -var-file=env.tfvars
$ terraform apply -var-file=env.tfvars
```

To destroy the resources you need to execute:

```bash
$ terraform destroy -var-file=env.tfvars
```

## Connect Instance

To connect to the EC2 public instance, use the following command:
`ssh -i <output_key_name>.pem ubuntu@<output_ec2_public_ip>`

To connect to the EC2 private instance using AWS EC2 Instance Connect, use the following command:
`ssh -i <output_key_name>.pem ubuntu@<output_ec2_private_id> -o ProxyCommand='aws ec2-instance-connect open-tunnel --instance-id <output_ec2_private_id> --region us-east-1 --profile <profile>'`

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.21.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_private"></a> [ec2\_private](#module\_ec2\_private) | ./ec2 | n/a |
| <a name="module_ec2_public"></a> [ec2\_public](#module\_ec2\_public) | ./ec2 | n/a |
| <a name="module_keypair"></a> [keypair](#module\_keypair) | ./keypair | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ec2_instance_connect_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_instance_connect_endpoint) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | Environment variable to specify a named profile | `string` | `"poc"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region | `string` | `"us-east-1"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type to use for the instance. | `string` | `"t3.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Keypair name | `string` | `"key-teste"` | no |
| <a name="input_name"></a> [name](#input\_name) | common name of resources | `string` | `"teste"` | no |
| <a name="input_private_subnets_cidrBlock"></a> [private\_subnets\_cidrBlock](#input\_private\_subnets\_cidrBlock) | The IPv4 CIDR block for the Private Subnet | `string` | `"172.23.0.0/24"` | no |
| <a name="input_public_subnets_cidrBlock"></a> [public\_subnets\_cidrBlock](#input\_public\_subnets\_cidrBlock) | The IPv4 CIDR block for the Public Subnet | `string` | `"172.23.1.0/24"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags | `map(string)` | `{}` | no |
| <a name="input_vpc_cidrBlock"></a> [vpc\_cidrBlock](#input\_vpc\_cidrBlock) | The IPv4 CIDR block for the VPC | `string` | `"172.23.0.0/23"` | no |
| <a name="input_vpn_name"></a> [vpn\_name](#input\_vpn\_name) | VPC Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_private_id"></a> [ec2\_private\_id](#output\_ec2\_private\_id) | n/a |
| <a name="output_ec2_private_ip"></a> [ec2\_private\_ip](#output\_ec2\_private\_ip) | n/a |
| <a name="output_ec2_public_ip"></a> [ec2\_public\_ip](#output\_ec2\_public\_ip) | n/a |
| <a name="output_key_name"></a> [key\_name](#output\_key\_name) | n/a |
