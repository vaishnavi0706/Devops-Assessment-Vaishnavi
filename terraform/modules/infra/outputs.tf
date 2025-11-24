output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "kubeconfig" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
