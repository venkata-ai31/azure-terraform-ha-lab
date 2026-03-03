resource "azurerm_availability_set" "avset" {
  name                         = "${var.rg_name}-avset"
  location                     = var.location
  resource_group_name          = var.rg_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
}

output "avset_id" {
  value = azurerm_availability_set.avset.id
}