terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "2fb1ed02-b334-4120-ae4c-1a350b02199a"
}


resource "azurerm_resource_group" "tfstate_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "tfstate_sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.tfstate_rg.name
  location                 = azurerm_resource_group.tfstate_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate_container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.tfstate_sa.name
  container_access_type = "private"
}