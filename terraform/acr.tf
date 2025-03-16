resource "azurerm_container_registry" "acr" {
  name                = "merlintestcontainerRegistry1"
  resource_group_name = var.rg.name
  location            = var.rg.location
  sku                 = "Standard"
  admin_enabled       = true
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "acr_password" {
  value = azurerm_container_registry.acr.admin_password
  sensitive = true
}