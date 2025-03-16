output "signalr_id" {
  description = "The ID of the created SignalR service"
  value       = azurerm_signalr_service.signalr.id
}

output "signalr_name" {
  description = "The name of the created SignalR service"
  value       = azurerm_signalr_service.signalr.name
}

output "signalr_primary_connection_string" {
  description = "Primary connection string for SignalR service"
  value       = azurerm_signalr_service.signalr.primary_connection_string
  sensitive   = true
}

output "signalr_primary_access_key" {
  description = "Primary access key for SignalR service"
  value       = azurerm_signalr_service.signalr.primary_access_key
  sensitive   = true
}

output "signalr_hostname" {
  description = "The hostname of the SignalR service"
  value       = azurerm_signalr_service.signalr.hostname
}
