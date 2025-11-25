resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate-rg"
  location = var.location
}

resource "random_string" "suffix" {
  length  = 5
  special = false
}

resource "azurerm_storage_account" "tfstate" {
  name                     = lower("tfstate${random_string.suffix.result}")
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}

module "infrastructure" {
  source = "./modules/infra"

  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  cluster_name        = var.cluster_name
}
