resource "random_password" "vmpassword" {
  length  = 20
  special = true
}

resource "azurerm_key_vault_secret" "vmpassword" {
  name         = "vmpassword"
  value        = random_password.vmpassword.result
  key_vault_id = var.key_vault_id

depends_on = [azurerm_key_vault_access_policy.terraform_sp_access]
}


