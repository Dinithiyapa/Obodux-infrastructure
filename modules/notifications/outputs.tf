output "notifications_service_id" {
  value       = azurerm_communication_service.notifications.id
  description = "The ID of the Azure Communication Services instance"
}

output "notifications_service_primary_key" {
  value       = azurerm_communication_service.notifications.primary_access_key
  sensitive   = true
  description = "Primary access key for sending emails and SMS"
}

output "notifications_service_connection_string" {
  value       = azurerm_communication_service.notifications.primary_connection_string
  sensitive   = true
  description = "Connection string for Azure Communication Services"
}
