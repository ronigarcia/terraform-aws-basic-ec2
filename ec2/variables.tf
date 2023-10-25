variable "name" {
  type        = string
  description = "Instance name"
}

variable "ami" {
  type        = string
  description = "AMI to use for the instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type to use for the instance."
}

variable "subnet" {
  type        = string
  description = "VPC Subnet ID to launch in."
}

variable "keypair" {
  type        = string
  description = "Key name of the Key Pair to use for the instance"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags"
}

variable "associate_public_ip_address" {
  type    = bool
  default = true
}