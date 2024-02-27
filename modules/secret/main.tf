module "keyvault" {

source         = "../modules/kv"
  key_vault_name = "kv-engine-eastus2-001"
  location       = "eastus2"
  bypass         = "AzureServices"
  ip_rules = []
  is_network_acls_default_action_allow = false
  tags                                 = {}

  vault = {

    location                    = "eastus2"
    resource_group_name         = "rg_eastus"
    purge_protection_enabled    = false
    enabled_for_disk_encryption = true
    sku_name                    = "standard"
    enable_rbac_authorization   = true
    enabled_for_deployment      = true
    tenant_id                   = "6a7cad51-05b4-4ea3-8435-b2157749ac6b"

  }
  depends_on = [module.resource_group]

  resource "azurerm_key_vault_secret" "secret" {
  name         = "secret-sauce"
  value        = "szechuan"
  key_vault_id = azurerm_key_vault.secret.id
}
}
