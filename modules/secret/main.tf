resource "azurerm_key_vault_secret" "vmpassword" {
  name         = "vmpassword"
  value        = "Azure@123"
   key_vault_id = var.key_vault_id

 depends_on = [azurerm_key_vault_access_policy.example]
}
  


