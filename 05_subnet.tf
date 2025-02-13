resource "azurerm_subnet" "subnet01" {
  name                 = var.subnet01_name
  address_prefixes     = ["10.0.0.0/24"]
  resource_group_name  = data.azurerm_resource_group.kblee.name
  virtual_network_name = azurerm_virtual_network.kblee.name
}

resource "azurerm_subnet" "subnet02" {
  name                 = var.subnet02_name
  address_prefixes     = ["10.0.244.0/24"]
  resource_group_name  = data.azurerm_resource_group.kblee.name
  virtual_network_name = azurerm_virtual_network.kblee.name
}

resource "azurerm_subnet" "subnet03" {
  name                 = var.subnet03_name
  address_prefixes     = ["10.0.1.0/24"]
  resource_group_name  = data.azurerm_resource_group.kblee.name
  virtual_network_name = azurerm_virtual_network.kblee.name
  service_endpoints = ["Microsoft.Storage"]

  delegation {
    name = "fs"

    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"
      actions = [ "Microsoft.Network/virtualNetworks/subnets/join/action" ]
    }
  }
}