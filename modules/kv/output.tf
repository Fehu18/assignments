output "vault" {
  value = azurerm_key_vault.main
}
output "secret" {
  value = azurerm_key_vault_secret.main.id
}
