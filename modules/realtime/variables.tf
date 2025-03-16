variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "signalr_name" {
  description = "The name of the Azure SignalR service"
  type        = string
}

variable "sku_name" {
  description = "The SKU name for SignalR (e.g., Standard_S1)"
  type        = string
}

variable "sku_capacity" {
  description = "The capacity for SignalR SKU"
  type        = number
}
# CORS Configuration
variable "allowed_origins" {
  description = "List of allowed origins for CORS"
  type        = list(string)
  
}

# Public Network Access
variable "public_network_access_enabled" {
  description = "Enable or disable public network access"
  type        = bool
  
}

# Logging
variable "connectivity_logs_enabled" {
  description = "Enable connectivity logs"
  type        = bool
 
}

variable "messaging_logs_enabled" {
  description = "Enable messaging logs"
  type        = bool
 
}

# Upstream Configuration (for backend integration)
variable "upstream_url" {
  description = "Backend URL for upstream events"
  type        = string
 
}

variable "hub_pattern" {
  description = "Hub pattern for upstream messages"
  type        = string

}
