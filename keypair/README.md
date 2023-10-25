## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.21.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.21.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.generated](https://registry.terraform.io/providers/hashicorp/aws/5.21.0/docs/resources/key_pair) | resource |
| [aws_ssm_parameter.private_key_pem](https://registry.terraform.io/providers/hashicorp/aws/5.21.0/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.public_key_openssh](https://registry.terraform.io/providers/hashicorp/aws/5.21.0/docs/resources/ssm_parameter) | resource |
| [tls_private_key.default](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Keypair name | `string` | `""` | no |
| <a name="input_ssh_key_algorithm"></a> [ssh\_key\_algorithm](#input\_ssh\_key\_algorithm) | SSH key algorithm | `string` | `"RSA"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_name"></a> [key\_name](#output\_key\_name) | n/a |
