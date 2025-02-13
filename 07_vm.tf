resource "azurerm_linux_virtual_machine" "kblee" {
  name                = var.vm01_name
  resource_group_name = data.azurerm_resource_group.kblee.name
  location            = data.azurerm_resource_group.kblee.location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.kblee.id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = azurerm_ssh_public_key.ssh_key.public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # RHEL
  # source_image_reference {
  #   publisher = "RedHat"
  #   offer     = "RHEL"
  #   sku       = "8_5"
  #   #sku       = "85-gen2"
  #   version   = "latest"
  # }

  # Ubuntu
  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}