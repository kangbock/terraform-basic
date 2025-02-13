resource "azurerm_network_interface" "kblee" {
  name                = var.nic01_name
  location            = data.azurerm_resource_group.kblee.location
  resource_group_name = data.azurerm_resource_group.kblee.name

  ip_configuration {
    name                          = "external"
    subnet_id                     = azurerm_subnet.subnet01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.kblee.id
  }
}

resource "azurerm_network_interface_security_group_association" "kblee" {
  network_interface_id      = azurerm_network_interface.kblee.id
  network_security_group_id = azurerm_network_security_group.kblee.id
}

resource "azurerm_public_ip" "kblee" {
  name                = var.pip01_name
  resource_group_name = data.azurerm_resource_group.kblee.name
  location            = data.azurerm_resource_group.kblee.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

output "client" {
  value = azurerm_public_ip.kblee.ip_address
}