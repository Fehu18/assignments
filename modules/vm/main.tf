
resource "azurerm_virtual_network" "testvnet" {
  name                = "vnet-engine-eastus2-001"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus2"
  resource_group_name = "rg_eastus"
}

resource "azurerm_subnet" "subnet" {
  name                 = "snet-vm-egine-eastus2-001"
  resource_group_name  = "rg_eastus"
  virtual_network_name = azurerm_virtual_network.testvnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# resource "azurerm_private_endpoint" "example" {
#   name                = "testprivateenpoint"
#  location            = "eastus2" 
#  resource_group_name = "rg_eastus"
#  subnet_id           = azurerm_subnet.subnet.id

# private_service_connection {
#    name                           = "test"
#    is_manual_connection           = false
#    private_connection_resource_id = azurerm_windows_virtual_machine.vm.id
#    subresource_names              = ["virtualMachines"]
#  }

#}

resource "azurerm_network_interface" "nic" {
  name                = "test-nic"
  location            = "eastus2"
  resource_group_name = "rg_eastus"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }

depends_on = [
    azurerm_virtual_network.testvnet
  ]
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = "vm-engine"
  location            = "eastus2"
  resource_group_name = "rg_eastus"
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = azurerm_key_vault_secret.vmpassword.value
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

depends_on = [
    azurerm_network_interface.nic,
    azurerm_key_vault_secret.vmpassword
  ]
}
