output "vault" {
  value = azurerm_key_vault.main
}
output "secret" {
  value = module.keyvault.id
}
