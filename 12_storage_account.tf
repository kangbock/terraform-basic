resource "azurerm_storage_account" "kblee" {
  name                     = "kbleestorageaccount"
  resource_group_name      = data.azurerm_resource_group.kblee.name
  location                 = data.azurerm_resource_group.kblee.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "loki" {
  name                  = "loki"
  storage_account_name    = azurerm_storage_account.kblee.name
  container_access_type = "private"
}

output "storage_account_name" {
  value = azurerm_storage_account.kblee.name
}

output "storage_account_primary_endpoint" {
  value = azurerm_storage_account.kblee.primary_blob_endpoint
}
