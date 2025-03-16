# ============================
# Virtual Network & Subnets
# ============================
resource "azurerm_virtual_network" "obodux_vnet" {
  name                = "obodux-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "app_subnet" {
  name                 = "app-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.obodux_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "database_subnet" {
  name                 = "database-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.obodux_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "redis_subnet" {
  name                 = "redis-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.obodux_vnet.name
  address_prefixes     = ["10.0.3.0/24"]
  # Delegate the subnet to Redis
  delegation {
    name = "redis-delegation"
    service_delegation {
      name = "Microsoft.Cache/redis"
    }
  }
}

resource "azurerm_subnet" "public_subnet" {
  name                 = "public-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.obodux_vnet.name
  address_prefixes     = ["10.0.4.0/24"]
}

# ============================
# Network Security Groups (NSGs)
# ============================
resource "azurerm_network_security_group" "app_nsg" {
  name                = "app-subnet-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_group" "database_nsg" {
  name                = "database-subnet-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_group" "redis_nsg" {
  name                = "redis-subnet-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_group" "public_nsg" {
  name                = "public-subnet-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# ============================
# Security Rules for Each NSG
# ============================

# App Subnet (Frontend & Backend)
resource "azurerm_network_security_rule" "allow_http" {
  name                        = "Allow-HTTP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  network_security_group_name = azurerm_network_security_group.app_nsg.name
}

resource "azurerm_network_security_rule" "allow_https" {
  name                        = "Allow-HTTPS"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  network_security_group_name = azurerm_network_security_group.app_nsg.name
}

# Database Subnet (PostgreSQL)
resource "azurerm_network_security_rule" "allow_postgres" {
  name                        = "Allow-Postgres"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "5432"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  network_security_group_name = azurerm_network_security_group.database_nsg.name
}

# Redis Subnet (Redis)
resource "azurerm_network_security_rule" "allow_redis" {
  name                        = "Allow-Redis"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "6379"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  network_security_group_name = azurerm_network_security_group.redis_nsg.name
}

# Public Subnet (Open Access)
resource "azurerm_network_security_rule" "allow_all" {
  name                        = "Allow-All-Traffic"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.public_nsg.name
}

# ============================
# Associate NSGs with Subnets
# ============================
resource "azurerm_subnet_network_security_group_association" "app_subnet_nsg" {
  subnet_id                 = azurerm_subnet.app_subnet.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "database_subnet_nsg" {
  subnet_id                 = azurerm_subnet.database_subnet.id
  network_security_group_id = azurerm_network_security_group.database_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "redis_subnet_nsg" {
  subnet_id                 = azurerm_subnet.redis_subnet.id
  network_security_group_id = azurerm_network_security_group.redis_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "public_subnet_nsg" {
  subnet_id                 = azurerm_subnet.public_subnet.id
  network_security_group_id = azurerm_network_security_group.public_nsg.id
}
