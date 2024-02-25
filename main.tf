module "resource_group" {
  source                  = "../modules/resource_group"
  resource_group_name     = "rg_eastus"
  resource_group_location = "eastus2"
}
module "aks" {
  source         = "../modules/aks"
  resource_group = module.resource_group.resource_group
  cluster_name   = "k8s-engine-eastus2-001"
  default_node_pool = {
    name                    = "aksnode"
    vm_size                 = "Standard_B2s"
    enable_auto_scaling     = true
    max_count               = 2
    min_count               = 1
    node_labels             = {}
    tags                    = {}
    zones                   = []
    critical_addons_enabled = false
  }
  network_profile = {
    network_plugin = "kubenet"
    load_balancer_sku = "standard"
  }
}
module "vnet" {
  source = "../modules/vnet"
  resource_group = module.resource_group.resource_group
}
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

}


