resource "azurerm_resource_group" "nsgs" {
    name = "NSGs"
    location = "West Europe"
    tags = {
      source = "citadel"
      env = "training"
  }  
}

resource "azurerm_network_security_group" "resource_group_default" {
    name = "ResourceGroupDefault"
    resource_group_name = azurerm_resource_group.nsgs.name
    location = "${azure_resource_group.nsgs.location}"
    tags = azurerm_resource_group.nsgs.tags 
}

resource "azurerm_network_security_rule" "AllowSSH" {
  name = "AllowSSH"
  resource_group_name = azurerm_resource_group.nsgs.name
  network_security_group_name = azurerm_network_security_group.resource_group_default.name
  location = azurerm_resource_group.nsgs.location
  priority = 1010
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = 22
  source_address_prefix = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "AllowHTTP" {
  name = "AllowHTTP"
  resource_group_name = azurerm_resource_group.nsgs.name
  network_security_group_name = azurerm_network_security_group.resource_group_default.name
  location = azurerm_resource_group.nsgs.location
  priority = 1020
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = 80
  source_address_prefix = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "AllowHTTPS" {
  name = "AllowHTTPS"
  resource_group_name = azurerm_resource_group.nsgs.name
  network_security_group_name = azurerm_network_security_group.resource_group_default.name
  location = azurerm_resource_group.nsgs.location
  priority = 1020
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = 443
  source_address_prefix = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "AllowSQLServer" {
  name = "AllowSQLServer"
  resource_group_name = azurerm_resource_group.nsgs.name
  network_security_group_name = azurerm_network_security_group.resource_group_default.name
  location = azurerm_resource_group.nsgs.location
  priority = 1443
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = 443
  source_address_prefix = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "AllowRDP" {
  name = "AllowRDP"
  resource_group_name = azurerm_resource_group.nsgs.name
  network_security_group_name = azurerm_network_security_group.resource_group_default.name
  location = azurerm_resource_group.nsgs.location
  priority = 1443
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = 443
  source_address_prefix = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_group" "nic_ubuntu" {
  name="nic_ubuntu"
  location = azurerm_resource_group.nsgs.location
  tags = azurerm_resource_group.nsgs.tags
  resource_group_name = " azurerm_resource_group.nsgs.name"

  security_rule = {
    access = "Allow"
    description = "The SSH rule to nic_ubuntu"
    destination_address_prefix = "*"
    destination_port_range = "22"
    direction = "Inbound"
    name = "SSH"
    priority = 100
    protocol = "Tcp"
    source_address_prefix = "*"
    source_port_range = "*"
  } 
}