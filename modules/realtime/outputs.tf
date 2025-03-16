output "signalr_id" {
  description = "The ID of the Azure SignalR Service"
  value       = azurerm_signalr_service.signalr.id
}

output "signalr_hostname" {
  description = "The primary hostname of the SignalR service"
  value       = azurerm_signalr_service.signalr.hostname
}

output "signalr_primary_connection_string" {
  description = "The primary connection string for SignalR"
  value       = azurerm_signalr_service.signalr.primary_connection_string
  sensitive   = true
}

output "signalr_secondary_connection_string" {
  description = "The secondary connection string for SignalR"
  value       = azurerm_signalr_service.signalr.secondary_connection_string
  sensitive   = true
}
