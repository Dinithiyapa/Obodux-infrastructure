variable "notifications_service_name" {
  type        = string
  description = "The name of the Azure Communication Services instance"
}

variable "location" {
  type        = string
  description = "Azure region where the service is deployed"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "environment" {
  type        = string
  description = "Deployment environment (e.g., dev, staging, prod)"
}
