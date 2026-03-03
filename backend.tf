terraform {
  backend "azurerm" {
    resource_group_name  = "rg-backend_lab"
    storage_account_name = "tfbackendddkifyh888"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
