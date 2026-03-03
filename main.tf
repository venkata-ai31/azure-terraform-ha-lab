# -----------------------------
# Resource  Group
# -----------------------------
resource "azurerm_resource_group" "rg" {
  name     = "rg-linux-vm-rg"
  location = "centralindia"
}