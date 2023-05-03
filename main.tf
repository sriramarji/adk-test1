
# Create a resource group
resource "azurerm_resource_group" "RG" {
  name     = "${var.RG_name}"
  location = "${var.RG_location}"
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}"
  address_space       =  ["${var.vnet_address}"]
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}

# Create a subnet
resource "azurerm_subnet" "snet" {
  name                 =  "${var.snet_name}"
  address_prefixes     =  ["${var.snet_address}"]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.RG.name
}

#public-ip
resource "azurerm_public_ip" "pip" {
  name                = "${var.pip_name}"
  resource_group_name = azurerm_resource_group.RG.name
  location            = azurerm_resource_group.RG.location
  allocation_method   = "${var.pip_allocation-method}"
}

# Create a network interface
resource "azurerm_network_interface" "netint" {
  name                = "${var.netint_name}"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  ip_configuration {
    name                          = "${var.ip-config_name}"
    subnet_id                     = azurerm_subnet.snet.id 
    public_ip_address_id          = azurerm_public_ip.pip.id
    private_ip_address_allocation = "${var.priv_addrallocation}"
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.nsg_name}"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}

resource "azurerm_network_security_rule" "nsr" {
  name                        = "${var.nsr_name}"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.RG.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

/*
resource "azurerm_network_security_group" "nsg" {
  name                = "my-nsg"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  security_rule {
    name                       = "my-nsr"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
*/
/*
resource "azurerm_network_interface_security_group_association" "nisg" {
  network_interface_id      = azurerm_network_interface.netint.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
*/
resource "azurerm_subnet_network_security_group_association" "nsg-sub-assoc" {
  subnet_id                 = azurerm_subnet.snet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

#Old resource
/*
resource "azurerm_virtual_machine" "vmach" {
  name                  = "my-vm"
  location              = azurerm_resource_group.RG.location
  resource_group_name   = azurerm_resource_group.RG.name
  network_interface_ids = [azurerm_network_interface.netint.id]
  vm_size               = "Standard_B2s"

  storage_os_disk {
    name              = "example-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_profile_windows_config {    
      provision_vm_agent  = true          
  }

  os_profile {
    computer_name  = "my-vm"
    admin_username = "ncruser"
    admin_password = "Ncruser@1234"
  }
}
*/

# New resource for windows OS image -- azurerm_windows_virtual_machine(Create a virtual machine)
resource "azurerm_windows_virtual_machine" "vmach" {
  name                  =  "${var.vmachine_name}"
  resource_group_name   = azurerm_resource_group.RG.name
  location              = azurerm_resource_group.RG.location
  size                  =  "${var.vmachine_size}"
  #computer_name        =  "Win123"
  admin_username        = "${var.username}"
  admin_password        = "${var.password}"
  network_interface_ids = [azurerm_network_interface.netint.id]

  os_disk {
    caching              = "${var.cache}"
    storage_account_type = "${var.storage-acct-type}"
  }

  source_image_reference {
    publisher = "${var.image_publisher}"
    offer     = "${var.image_offer}"
    sku       = "${var.image_sku}"
    version   = "${var.image_version}"
  }
}
