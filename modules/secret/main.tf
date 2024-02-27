 resource "azurerm_key_vault_secret" "secret" {
  name         = "secret-sauce"
  value        = "szechuan"
  key_vault_id = "10"
}

