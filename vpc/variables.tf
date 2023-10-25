variable "cidrBlock" {
  description = "[OBRIGATÓRIO] Endereço do bloco cidr ipv4 que será usado pelo VPC"
  type        = string
}

variable "vpc_name" {
  description = "[OBRIGATÓRIO] Nome a ser dado ao VPC"
  type        = string
}

variable "public_subnets" {
  description = "[OBRIGATÓRIO] Lista com os blocos de endereços para as subredes públicas"
  type        = list(map(string))
}

variable "private_subnets" {
  description = "[OBRIGATÓRIO] Lista com os blocos de endereços para as subredes privadas"
  type        = list(map(string))
}

variable "enable_dns_support" {
  description = "[OPCIONAL] Definir se a VPC terá suporte a DNS [DEFAULT:true]"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "[OPCIONAL] Definir se a VPC terá suporte a DNS hostnames [DEFAULT:true]"
  type        = bool
  default     = true
}

variable "public_subnet_name" {
  description = "Nome que será dado as subnets públicas"
  type        = string
  default     = "Public Subnet"
}

variable "public_rt_name" {
  description = "Nome que será dado a route table pública"
  type        = string
  default     = "Public Route Table"
}

variable "private_subnet_name" {
  description = "Nome que será dado as subnets privadas"
  type        = string
  default     = "Private Subnet"
}

variable "private_rt_name" {
  description = "Nome que será dado as route tables privadas"
  type        = string
  default     = "Private Route Table"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags"
}
  