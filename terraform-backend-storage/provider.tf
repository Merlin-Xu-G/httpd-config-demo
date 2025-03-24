terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.23.0"
    }
  }
}

provider "azurerm" {
  features {}
  tenant_id                       = var.azAccountInfo.tenantId
  subscription_id                 = var.azAccountInfo.subscriptionId
  resource_provider_registrations = "none"
}
