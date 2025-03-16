output "clerk_auth_backend" {
  description = "Backend App Service integrated with Clerk authentication"
  value       = azurerm_linux_web_app.backend_auth.name
}

output "clerk_publishable_key" {
  description = "Clerk publishable key used for frontend integration"
  value       = var.clerk_publishable_key
}
