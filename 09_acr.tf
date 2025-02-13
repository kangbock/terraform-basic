data "azurerm_container_registry" "kblee" {
  name                = var.acr_name
  resource_group_name = data.azurerm_resource_group.kblee.name
}