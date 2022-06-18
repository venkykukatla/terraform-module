provider "azurerm" {
  features {}

  subscription_id = "9a7a0f0f-324b-4431-a698-f8972a37951b"
  client_id       = "eb4d8d39-61c8-41c0-85d7-bfc8d46ec965"
  client_secret   = "yAr8Q~WmVMFpI5WemVlfFuKEGCj3JEZs_GgTBaZh"
  tenant_id       = "d7668e05-4a65-43f9-9db8-1b5d07e61c92"
}
resource "azurerm_resource_group" "rg" {
  name     = var.azurerm_resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name
  depends_on = [
    azurerm_resource_group.rg
  ]
}

resource "azurerm_subnet" "subnet01" {
  name                 = var.azurerm_subnet_name
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = var.address_prefixes
  depends_on = [
    azurerm_resource_group.rg,azurerm_virtual_network.vnet
  ]
}


