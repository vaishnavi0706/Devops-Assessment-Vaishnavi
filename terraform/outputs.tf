output "backend_storage_account" {
  value = azurerm_storage_account.tfstate.name
}

output "backend_resource_group" {
  value = azurerm_resource_group.tfstate.name
}

output "aks_name" {
  value = module.infrastructure.aks_name
}

output "vnet_id" {
  value = module.infrastructure.vnet_id
}
