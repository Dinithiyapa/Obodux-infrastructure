resource "azurerm_redis_cache" "bullmq_redis" {
  name                = "obodux-redis"
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity           = var.redis_capacity
  family             = var.redis_family
  sku_name           = var.redis_sku
  enable_non_ssl_port = false  # Enforce secure connection
  minimum_tls_version = "1.2"

  redis_configuration {
    maxmemory_policy          = "allkeys-lru"
    persistence_enabled       = true
    rdb_backup_enabled        = true
    rdb_backup_frequency      = 15  # Backup every 15 minutes
    rdb_storage_connection_string = var.storage_account_connection_string
    aof_backup_enabled        = true
    aof_storage_connection_string = var.storage_account_connection_string
  }
  # Attach to the redis subnet
  subnet_id = var.redis_subnet_id
}
