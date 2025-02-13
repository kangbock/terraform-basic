resource "azurerm_private_dns_zone" "private_dns" {
  name = "prod-kb97.mysql.database.azure.com"
  resource_group_name = data.azurerm_resource_group.kblee.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_vnet_link" {
  name = "private-dns-vnet-link"
  private_dns_zone_name = azurerm_private_dns_zone.private_dns.name
  resource_group_name = data.azurerm_resource_group.kblee.name
  virtual_network_id = azurerm_virtual_network.kblee.id
}