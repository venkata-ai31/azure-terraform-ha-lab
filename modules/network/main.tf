resource "azurerm_virtual_network" "vnet" {
  name                = "${var.rg_name}-vnet"
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.rg_name}-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_prefix]
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}