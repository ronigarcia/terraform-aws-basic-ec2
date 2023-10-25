variable "key_name" {
  type        = string
  default     = ""
  description = "Keypair name"
}

variable "ssh_key_algorithm" {
  type        = string
  default     = "RSA"
  description = "SSH key algorithm"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags"
}
  