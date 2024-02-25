resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  address_space       = var.address_space
}
resource "azurerm_subnet" "subnet_kv" {
  name                 = var.subnet_kv_name
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_kv_address_space
    depends_on = [
    azurerm_virtual_network.vnet
  ]

}
resource "azurerm_subnet" "subnet_vm" {
  name                 = var.subnet_vm_name
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_vm_address_space
    depends_on = [
    azurerm_subnet.subnet_kv
  ]
}
