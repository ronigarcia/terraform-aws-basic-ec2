variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}

variable "aws_profile" {
  type        = string
  default     = "default"
  description = "Environment variable to specify a named profile"
}

variable "vpn_name" {
  description = "VPC Name"
  type        = string
}

variable "vpc_cidrBlock" {
  description = "The IPv4 CIDR block for the VPC"
  type        = string
  default     = "172.23.0.0/23"
}

variable "public_subnets_cidrBlock" {
  description = "The IPv4 CIDR block for the Public Subnet"
  type        = string
  default     = "172.23.1.0/24"
}

variable "private_subnets_cidrBlock" {
  description = "The IPv4 CIDR block for the Private Subnet"
  type        = string
  default     = "172.23.0.0/24"
}

variable "key_name" {
  type        = string
  default     = "key-teste"
  description = "Keypair name"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Instance type to use for the instance."
}

variable "name" {
  type        = string
  default     = "teste"
  description = "common name of resources"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags"
}
