variable "az-subscrip_id"{
    type = string
    description = "Create subscription id in your Azure account"
    default = "f49abf3e-eef6-4df0-880a-3f5e58f9e451"
}
variable "az-client_id"{
    type = string
    description = "Create client-id in your Azure account"
    default = "c7569eb6-780b-45a3-9c5e-499506217035"
}
variable "az-client_secret"{
    type = string
    description = "Create client secret in your Azure account"
    default = "O~p8Q~CyuiQy4MTq.CAG1PCoIzav9.oDFdTqebfS"
}
variable "az-tenant_id"{
    type = string
    description = "Create tenant id in your Azure account"
    default = "3d8b0edd-cfe5-4115-bc90-77b680b2f199"
}
variable "RG_name"{
    type = string
    description = "For naming resource group"
    default = "ncr-resource-group"
}
variable "RG_location"{
    type = string
    description = "For selecting location"
    default = "East US 2"
}
variable  "vnet_name"{
    type = string
    description = "For naming virtual network"
    default = "ncr-vnet"
}
variable "vnet_address" {
    type = string
    description = "For defining the virtual network cidr range "
    default = "192.68.0.0/16"
}
variable "snet_name" {
    type = string
    description = "For naming the subnet"
    default = "ncr-subnet"
}
variable "snet_address" {
    type = string
    description = "For defining the subnet cidr range"
    default = "192.68.1.0/24"
}
variable "pip_name" {
    type = string
    description = "For naming the publicip"
    default = "publicip"
}
variable "pip_allocation-method" {
    type = string
    default = "Dynamic"
}
variable "netint_name" {
    type = string
    description = "For naming the network interface"
    default = "ncr-nic"
}
variable "ip-config_name" {
    type = string
    default = "ncr-ipconfig"
}
variable "priv_addrallocation" {
    type = string
    default = "Dynamic"
}
variable "nsg_name" {
    type = string
    description = "For naming the network security group"
    default = "ncr-nsg"
}
variable "nsr_name" {
    type = string
    description = "For naming the network security rule"
    default = "ncr-nsr"
}
variable "vmachine_name" {
    type = string
    description = "For naming the virtual machine"
    default = "ncr-vm"
}
variable "vmachine_size"{
    type = string
    description = "Select any specific VM size based on requirement"
    default = "Standard_B1s"
}
variable "username" {
    type = string
    description = "Give any valid username"
    default = "testuser"
}
variable "password" {
    type = string
    description = "Give valid password with specialcase,numbers,upperand lowercase"
    default = "Testuser@456"
}
variable "cache" {
    type = string
    default = "ReadWrite"
}
variable "storage-acct-type" {
    type = string
    default = "Standard_LRS"
}
variable "image_publisher" {
    type = string
    default = "MicrosoftWindowsServer"
}
variable "image_offer" {
    type = string
    default = "WindowsServer"
}
variable "image_sku" {
    type = string
    default = "2019-Datacenter"
}
variable "image_version" {
    type = string
    default = "latest"
}