provider "azurerm" {
  features {}
 
  subscription_id = "${var.az-subscrip_id}"
  client_id       = "${var.az-client_id}"
  client_secret   = "${var.az-client_secret}"
  tenant_id       = "${var.az-tenant_id}"
}


/*
variable "vm_name{}"
vm_name="my-vm"
name     = "${var.vm_name}"
*******************************************


variable "az-client_id{}"
az-client_id= "c7569eb6"
client_id = "${var.az-client_id}" 

*/
