output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.obodux_vnet.id
}

output "app_subnet_id" {
  description = "The ID of the subnet for backend applications."
  value       = azurerm_subnet.app_subnet.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet for frontend applications."
  value       = azurerm_subnet.public_subnet.id
}

output "database_subnet_id" {
  description = "The ID of the subnet for the database."
  value       = azurerm_subnet.database_subnet.id
}

output "redis_subnet_id" {
  description = "The ID of the subnet for Redis."
  value       = azurerm_subnet.redis_subnet.id
}
