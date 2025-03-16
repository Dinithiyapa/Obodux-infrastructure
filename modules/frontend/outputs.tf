output "app_service_plan_id" {
  description = "The ID of the App Service Plan."
  value       = azurerm_app_service_plan.frontend.id
}

output "web_app_hostname" {
  description = "The hostname of the Web App."
  value       = azurerm_linux_web_app.frontend.default_hostname
}

output "web_app_identity_principal_id" {
  description = "The Principal ID of the Web App's System Assigned Managed Identity."
  value       = azurerm_linux_web_app.frontend.identity[0].principal_id
}
