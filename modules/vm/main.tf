resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.rg_name}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.vm_count
  name                = "${var.rg_name}-vm-${count.index}"
  resource_group_name = var.rg_name
  location            = var.location
  availability_set_id = var.avset_id

  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]
}