output "database_id" {
  description = "ID of the PostgreSQL flexible server"
  value       = azurerm_postgresql_flexible_server.database.id
}

output "database_fqdn" {
  description = "Fully qualified domain name (FQDN) of the database server"
  value       = azurerm_postgresql_flexible_server.database.fully_qualified_domain_name
}

output "database_connection_string" {
  description = "PostgreSQL database connection string"
  value       = "postgresql://${var.db_admin_user}:${var.db_admin_password}@${azurerm_postgresql_flexible_server.database.fqdn}:5432/${var.database_name}"
  sensitive   = true
}
