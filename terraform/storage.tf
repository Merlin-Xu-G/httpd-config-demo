resource "azurerm_storage_account" "httpconfigStorageAccount" {
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
  name               = "http-config-file"
  storage_account_id = azurerm_storage_account.httpconfigStorageAccount.id
  quota              = 1
  access_tier        = "Hot"
  enabled_protocol   = "SMB"
}

resource "azurerm_storage_share_file" "httpdRedirectConfig" {
  name             = "redirect.conf"
  storage_share_id = azurerm_storage_share.httpconfigStorageShare.url
  source           = "resources/redirect.conf"
}