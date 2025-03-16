output "app_service_plan_id" {
  description = "The ID of the Backend App Service Plan."
  value       = azurerm_app_service_plan.backend.id
}

output "web_app_hostname" {
  description = "The hostname of the Backend Web App."
  value       = azurerm_linux_web_app.backend.default_hostname
}

output "web_app_identity_principal_id" {
  description = "The Principal ID of the Backend Web App's System Assigned Managed Identity."
  value       = azurerm_linux_web_app.backend.identity[0].principal_id
}

output "backend_api_url" {
  description = "The url of the backend"
  value = "https://${azurerm_linux_web_app.backend.default_hostname}"
}
