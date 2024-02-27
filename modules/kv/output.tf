output "vault" {
  value = azurerm_key_vault.main
}

output "key_vault_id" {
  value = azurerm_key_vault.main.id
}

