
# VNet + Subnets
resource "azurerm_virtual_network" "vnet" {
  name                = "project-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.100.0.0/16"]
}

resource "azurerm_subnet" "public" {
  name                 = "public-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.100.1.0/24"]
}

resource "azurerm_subnet" "private" {
  name                 = "private-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.100.2.0/24"]
}

# NSG
resource "azurerm_network_security_group" "nsg" {
  name                = "project-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "private_assoc" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "projectdns"

  default_node_pool {
    name            = "systempool"
    vm_size         = "Standard_B2s"
    node_count      = 1
    vnet_subnet_id  = azurerm_subnet.private.id
  }

  identity {
    type = "SystemAssigned"
  }
}
