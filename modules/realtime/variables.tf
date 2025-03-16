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
