output "resource_group_name" {
  value = azurerm_resource_group.tfstate_rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.tfstate_sa.name
}

output "storage_container_name" {
  value = azurerm_storage_container.tfstate_container.name
}

output "location" {
  value = azurerm_resource_group.tfstate_rg.location
}
