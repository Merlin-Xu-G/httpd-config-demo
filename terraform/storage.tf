resource "azurerm_storage_account" "httpconfigStorageAccount" {
  count = local.config_storage_count

  name                     = "httpconfig"
  resource_group_name      = var.rg.name
  location                 = var.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "httpconfig"
  }
}

resource "azurerm_storage_share" "httpconfigStorageShare" {
  count = local.config_storage_count

  name               = "http-config-file"
  storage_account_id = azurerm_storage_account.httpconfigStorageAccount[0].id
  quota              = 1
  access_tier        = "Hot"
  enabled_protocol   = "SMB"
}

resource "azurerm_storage_share_file" "httpdRedirectConfig" {
  count = local.config_storage_count

  name             = "redirect.conf"
  storage_share_id = azurerm_storage_share.httpconfigStorageShare[0].url
  source           = "resources/redirect.conf"
}