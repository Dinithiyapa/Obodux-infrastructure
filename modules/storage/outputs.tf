# Storage Account Name
output "storage_account_name" {
  description = "The name of the Azure Storage Account"
  value       = azurerm_storage_account.storage.name
}

output "storage_account_connection_string" {
  value     = azurerm_storage_account.storage.primary_connection_string
  sensitive = true
}

# Storage Account Primary Key (Sensitive)
output "storage_account_primary_key" {
  description = "The primary access key for the Storage Account"
  value       = azurerm_storage_account.storage.primary_access_key
  sensitive   = true
}

# Storage Container URL
output "storage_container_url" {
  description = "The URL of the Blob Storage Container"
  value       = azurerm_storage_container.container.id
}
