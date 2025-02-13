resource "azurerm_virtual_network" "kblee" {
  name                = var.vnet_name
  location            = data.azurerm_resource_group.kblee.location
  resource_group_name = data.azurerm_resource_group.kblee.name
  address_space       = ["10.0.0.0/16"]
}
