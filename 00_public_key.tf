resource "azurerm_ssh_public_key" "ssh_key" {
  name                = "kblee-key"
  resource_group_name = data.azurerm_resource_group.kblee.name
  location            = var.location_01
  public_key          = file("${var.pub_key_path}")
}
