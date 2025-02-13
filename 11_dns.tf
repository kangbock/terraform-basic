resource "azurerm_dns_zone" "dns" {
  name                = "k-tech.cloud"
  resource_group_name = data.azurerm_resource_group.kblee.name
}

# resource "azurerm_dns_ns_record" "ns_record" {
#   name                = "test"
#   zone_name           = azurerm_dns_zone.dns.name
#   resource_group_name = azurerm_resource_group.client_rg.name
#   ttl                 = 300

#   records = ["ns1-08.azure-dns.com.", "ns2-08.azure-dns.net.", "ns3-08.azure-dns.org.", "ns4-08.azure-dns.info.", "ns1.k-tech.cloud."]
# }

resource "azurerm_dns_a_record" "ns" {
  name                = "@"
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = data.azurerm_resource_group.kblee.name
  ttl                 = 300
  records             = ["4.230.146.46"]
}

resource "azurerm_dns_a_record" "ns1" {
  name                = "ns1"
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = data.azurerm_resource_group.kblee.name
  ttl                 = 300
  records             = ["4.230.146.46"]
}

resource "azurerm_dns_a_record" "www" {
  name                = "www"
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = data.azurerm_resource_group.kblee.name
  ttl                 = 300
  records             = ["4.230.146.46"]
}

resource "azurerm_dns_a_record" "prometheus" {
  name                = "prometheus"
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = data.azurerm_resource_group.kblee.name
  ttl                 = 300
  records             = ["4.230.158.99"]
}

resource "azurerm_dns_a_record" "grafana" {
  name                = "grafana"
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = data.azurerm_resource_group.kblee.name
  ttl                 = 300
  records             = ["4.230.158.99"]
}

resource "azurerm_dns_a_record" "dashboard" {
  name                = "dashboard"
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = data.azurerm_resource_group.kblee.name
  ttl                 = 300
  records             = ["4.230.158.99"]
}

resource "azurerm_dns_a_record" "alertmanager" {
  name                = "alertmanager"
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = data.azurerm_resource_group.kblee.name
  ttl                 = 300
  records             = ["4.230.158.99"]
}

resource "azurerm_dns_a_record" "jenkins" {
  name                = "jenkins"
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = data.azurerm_resource_group.kblee.name
  ttl                 = 300
  records             = ["4.230.158.99"] //aks loadbalancer (jenkins)
}

resource "azurerm_dns_a_record" "argocd" {
  name                = "argocd"
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = data.azurerm_resource_group.kblee.name
  ttl                 = 300
  records             = ["4.230.158.99"]
}

resource "azurerm_dns_a_record" "harbor" {
  name                = "harbor"
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = data.azurerm_resource_group.kblee.name
  ttl                 = 300
  records             = ["4.230.158.99"] //ingress-controller ip
}

resource "azurerm_dns_a_record" "loki" {
  name                = "loki"
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = data.azurerm_resource_group.kblee.name
  ttl                 = 300
  records             = ["4.230.158.99"]
}
