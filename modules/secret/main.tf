variable "key_vault_id" {
  description = "The ID of the Key Vault where the secret will be stored"
  type        = string
}

resource "random_password" "vmpassword" {
  length  = 20
  special = true
}

resource "azurerm_key_vault_secret" "vmpassword" {
  name         = "vmpassword"
  value        = random_password.vmpassword.result
  key_vault_id = var.key_vault_id
}


