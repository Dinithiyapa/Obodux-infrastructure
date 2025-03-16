# General Configurations
resource_group_name = "obodux-rg"
location           = "UK South"

# Database Configurations
db_admin_user      = "<db-admin-user>"
db_admin_password  = "<db-admin-password>"
database_name      = "obodux-database"
database_subnet_id = "azurerm_subnet.database_subnet.id"

# Queue System (Redis) Configurations
redis_capacity                      = 2
redis_family                        = "P" 
redis_sku                           = "Premium"
redis_subnet_id                     = "azurerm_subnet.redis_subnet.id"
storage_account_connection_string   = "azurerm_storage_account.storage.primary_connection_string"

# Notifications Configurations
notifications_service_name = "obodux-notifications-service"
data_location              = "<your-data-location>"

# Storage Configurations
storage_account_name       = "obodux-storageaccount"
storage_tier               = "Hot"
replication_type           = "LRS"
storage_container_name             = "storage-container"
public_access              = "private"
delete_retention_days      = 30 

# Backend Configurations
app_subnet_id                    = "azurerm_subnet.app_subnet.id"
backend_app_name                  = "obodux-backend"
backend_docker_image_tag          = "<your-backend-docker-image-tag>"
database_connection_string        = "postgresql://${var.db_admin_user}:${var.db_admin_password}@${azurerm_postgresql_flexible_server.database.fqdn}:5432/${var.database_name}"
redis_connection_string           = "azurerm_redis_cache.bullmq_redis.primary_connection_string"
notifications_service_connection_string = "azurerm_communication_service.notifications.primary_connection_string"
storage_account_primary_key       = "azurerm_storage_account.storage.primary_access_key"
storage_container_name                    = "storage-container"

# Frontend Configurations
backend_api_url          = "https://${azurerm_linux_web_app.backend.default_hostname}"
frontend_docker_image_tag = "<your-frontend-docker-image-tag>"
public_subnet_id         = "azurerm_subnet.public_subnet.id"

# Real-Time Communication (SignalR) Configurations
signalr_name                    = "obodux-signalr-service"
sku_name                         = "Standard_S1"
sku_capacity                     = 1
allowed_origins                  = ["<your-allowed-origin-1>", "<your-allowed-origin-2>"]
public_network_access_enabled    = false
connectivity_logs_enabled        = true
messaging_logs_enabled           = true
upstream_url                     = "<your-upstream-url>" #replace
hub_pattern                      = "hub1"
