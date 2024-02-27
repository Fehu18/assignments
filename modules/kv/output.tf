output "vault" {
  value = azurerm_key_vault.main
}
output "secret" {
  value = module.kv.id
}
