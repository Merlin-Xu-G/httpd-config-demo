variable "azAccountInfo" {
  type = map(string)
}

variable "rg" {
  type = map(string)
}

variable "useExternalConfig" {
  type    = bool
  default = false
}

locals {
  config_storage_count = var.useExternalConfig ? 1 : 0
}
