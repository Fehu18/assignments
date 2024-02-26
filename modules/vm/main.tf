
resource "azurerm_virtual_network" "testvnet" {
  name                = "vnet-engine-eastus2-001"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus2"
  resource_group_name = "rg_eastus"
}

resource "azurerm_subnet" "subnet" {
  name                 = "snet-egine-eastus2-001"
  resource_group_name = "rg_eastus"
  virtual_network_name = azurerm_virtual_network.testvnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "test-nic"
  location            = "eastus2"
  resource_group_name = "rg_eastus"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = "vm-engine-eastus2-001"
  location            = "eastus2"
  resource_group_name = "rg_eastus"
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
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
}
