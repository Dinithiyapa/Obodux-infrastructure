output "redis_host" {
  value = azurerm_redis_cache.bullmq_redis.hostname
}

output "redis_connection_string" {
  value     = azurerm_redis_cache.bullmq_redis.primary_connection_string
  sensitive = true
}
