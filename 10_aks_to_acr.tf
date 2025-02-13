resource "azurerm_role_assignment" "kblee" {
  principal_id                     = azurerm_kubernetes_cluster.kblee.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = data.azurerm_container_registry.kblee.id
  skip_service_principal_aad_check = true
}