
resource "azurerm_public_ip" "ip_aks" {
  name                = "ip-${var.cluster_name}"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = var.resource_group.location
  name                = var.cluster_name
  resource_group_name = var.resource_group.name
  dns_prefix          = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  tags                = var.tags
  sku_tier            = var.sku_tier

  azure_policy_enabled = var.azure_policy_enabled

  oidc_issuer_enabled       = var.oidc_issuer_enabled
  workload_identity_enabled = var.workload_identity_enabled

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    orchestrator_version         = var.default_node_pool.orchestrator_version
    os_disk_type                 = var.default_node_pool.os_disk_type
    os_disk_size_gb              = var.default_node_pool.os_disk_size_gb
    name                         = var.default_node_pool.name
    vm_size                      = var.default_node_pool.vm_size
    enable_auto_scaling          = var.default_node_pool.enable_auto_scaling
    max_count                    = var.default_node_pool.max_count
    min_count                    = var.default_node_pool.min_count
    node_labels                  = var.default_node_pool.node_labels
    tags                         = var.default_node_pool.tags
    zones                        = var.default_node_pool.zones
    only_critical_addons_enabled = var.default_node_pool.critical_addons_enabled
    vnet_subnet_id               = var.subnet_id
  }

  network_profile {
    network_policy    = var.network_profile.network_policy
    network_plugin    = var.network_profile.network_plugin
    load_balancer_sku = var.network_profile.load_balancer_sku
  }
  api_server_access_profile {
    authorized_ip_ranges = var.api_server_authorized_ip_ranges
  }
}
