variable "key_vault_name" {
  type        = string
  nullable    = false
  description = "Key Vault name."
}

variable "tags" {
  type    = map(string)
  default = {}
}


variable "location" {
  type        = string
  nullable    = false
  description = "Codes that indicates an Azure location (Region)."
}

variable "vault" {
  type = object({
    resource_group_name         = string
    purge_protection_enabled    = optional(bool, true)
    enabled_for_disk_encryption = optional(bool, true)
    sku_name                    = string
    enable_rbac_authorization   = optional(bool, true)
    enabled_for_deployment      = optional(bool, false)
  })
}
variable "is_network_acls_default_action_allow" {
  type        = bool
  nullable    = false
  default     = false
  description = "Key vault Network ACL default=Allow"
}
variable "ip_rules" {
  type        = list(string)
  default     = []
  description = "IP list of key vault"
}

variable "bypass" {
  type        = string
  default     = "AzureServices"
  description = "bypass values"
}
