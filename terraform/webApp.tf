resource "azurerm_service_plan" "httpddemoServicePlan" {
  name                = "hdsp"
  resource_group_name = var.rg.name
  location            = var.rg.location
  os_type             = "Linux"
  sku_name            = "B2"
}

resource "azurerm_linux_web_app" "httpddemoWebApp" {
  name                = "hdwa"
  resource_group_name = var.rg.name
  location            = azurerm_service_plan.httpddemoServicePlan.location
  service_plan_id     = azurerm_service_plan.httpddemoServicePlan.id

  site_config {
    always_on                         = true
    health_check_path                 = "/"
    health_check_eviction_time_in_min = 3
    worker_count                      = 2
    application_stack {

      docker_image_name        = "httpd-demo"
      docker_registry_url      = "https://${azurerm_container_registry.acr.login_server}"
      docker_registry_username = azurerm_container_registry.acr.admin_username
      docker_registry_password = azurerm_container_registry.acr.admin_password
    }
  }

  storage_account {
    name         = "http-demo-config"
    account_name = azurerm_storage_account.httpconfigStorageAccount.name
    mount_path   = "/usr/local/apache2/conf/redirect"
    share_name   = azurerm_storage_share.httpconfigStorageShare.name
    access_key   = azurerm_storage_account.httpconfigStorageAccount.primary_access_key
    type         = "AzureFiles"
  }
}