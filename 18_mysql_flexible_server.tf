resource "azurerm_mysql_flexible_server" "kb97_mysql" {
  location                     = data.azurerm_resource_group.kblee.location
  resource_group_name          = data.azurerm_resource_group.kblee.name
  name                         = "prod-kb97-mysql"
  administrator_login          = var.db_id
  administrator_password       = var.db_pw
  backup_retention_days        = 7
  delegated_subnet_id          = azurerm_subnet.subnet03.id
  geo_redundant_backup_enabled = false
  private_dns_zone_id          = azurerm_private_dns_zone.private_dns.id
  sku_name                     = "GP_Standard_D2ds_v4"
  version                      = "8.0.21"
  zone                         = "2"

  # high_availability {
  #   mode                      = "ZoneRedundant"
  #   standby_availability_zone = "2"
  # }

  # maintenance_window {
  #   day_of_week  = 0
  #   start_hour   = 8
  #   start_minute = 0
  # }

  # storage {
  #   iops    = 360
  #   size_gb = 20
  # }

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.private_dns_vnet_link
  ]
}
