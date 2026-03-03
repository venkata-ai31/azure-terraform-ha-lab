module "rg" {
  source = "./modules/resource_group"
  resource_group_name = "rg-ha-python"
  location            = "centralindia"
}

module "network" {
  source = "./modules/network"
  rg_name       = module.rg.rg_name
  location      = "centralindia"
  address_space = ["10.0.0.0/16"]
  subnet_prefix = "10.0.1.0/24"
}

module "nsg" {
  source    = "./modules/nsg"
  rg_name   = module.rg.rg_name
  location  = "centralindia"
  subnet_id = module.network.subnet_id
}

module "avset" {
  source   = "./modules/availability_set"
  rg_name  = module.rg.rg_name
  location = "centralindia"
}

module "vm" {
  source         = "./modules/vm"
  rg_name        = module.rg.rg_name
  location       = "centralindia"
  subnet_id      = module.network.subnet_id
  avset_id       = module.avset.avset_id
  vm_count       = 2
  vm_size        = "Standard_B1s"
  admin_username = "azureuser"
  admin_password = var.admin_password
}

module "flask_app" {
  source   = "./modules/flask_app"
  vm_ids   = module.vm.vm_ids
  vm_count = 2
}