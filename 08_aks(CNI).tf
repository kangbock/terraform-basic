resource "azurerm_kubernetes_cluster" "kblee" {
  name                = var.aks_name
  location            = data.azurerm_resource_group.kblee.location
  resource_group_name = data.azurerm_resource_group.kblee.name
  dns_prefix          = "kblee-dns"

  default_node_pool {
    name           = "default"
    node_count     = 3
    vm_size        = "Standard_D4s_v5"
    vnet_subnet_id = azurerm_subnet.subnet02.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    network_policy      = "azure"
    service_cidr        = "10.224.0.0/12"
    dns_service_ip      = "10.224.0.10"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.kblee.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.kblee.kube_config_raw
  sensitive = true
}
