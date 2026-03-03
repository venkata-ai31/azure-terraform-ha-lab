variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "rg_name" { type = string }
variable "address_space" { type = list(string) }
variable "subnet_prefix" { type = string }
variable "subnet_id" { type = string }
variable "avset_id" { type = string }
variable "vm_count" { type = number }
variable "vm_size" { type = string }
variable "admin_username" { type = string }
variable "admin_password" { type = string }
variable "vm_ids" { type = list(string) }




