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


terraform {
  backend "azurerm" {
    resource_group_name  = "my_rg"
    storage_account_name = "tfstatestorage420"
    container_name       = "terraform-state"
    key                  = "aks.terraform.tfstate"
  }
}
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "myaks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "standard_a2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
