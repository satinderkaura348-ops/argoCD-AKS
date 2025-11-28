output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "rg_name" {
  value = var.resource_group_name
}