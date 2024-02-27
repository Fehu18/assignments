variable "key_vault_id" {
  default = ""
}

variable "key_vault_name" {
  type        = string
  nullable    = false
  description = "Key Vault name."
}

