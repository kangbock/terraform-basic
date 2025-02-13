resource "azurerm_network_security_group" "kblee" {
  name                = var.nsg_name
  location            = data.azurerm_resource_group.kblee.location
  resource_group_name = data.azurerm_resource_group.kblee.name
}

resource "azurerm_network_security_rule" "fw01" {
  name                        = "fw01"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["22"]
  source_address_prefixes     = ["211.215.58.26"]
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = data.azurerm_resource_group.kblee.name
  network_security_group_name = azurerm_network_security_group.kblee.name
}

resource "azurerm_network_security_rule" "fw02" {
  name                        = "fw02"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443"]
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = data.azurerm_resource_group.kblee.name
  network_security_group_name = azurerm_network_security_group.kblee.name
}

resource "azurerm_network_security_rule" "fw03" {
  name                        = "fw03"
  priority                    = 600
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["3000"]
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = data.azurerm_resource_group.kblee.name
  network_security_group_name = azurerm_network_security_group.kblee.name
}

resource "azurerm_network_security_rule" "fw04" {
  name                        = "fw04"
  priority                    = 900
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["3306"]
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = data.azurerm_resource_group.kblee.name
  network_security_group_name = azurerm_network_security_group.kblee.name
}

resource "azurerm_network_security_rule" "fw05" {
  name                        = "fw05"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["8080"]
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = data.azurerm_resource_group.kblee.name
  network_security_group_name = azurerm_network_security_group.kblee.name
}