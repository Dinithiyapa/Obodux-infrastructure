resource "azurerm_app_service_plan" "backend" {
  name                = "obodux-backend-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"

  sku {
    tier = "Standard"
    size = "S1"
  }
}


resource "azurerm_linux_web_app" "backend" {
  name                = var.backend_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_app_service_plan.backend.id

  site_config {
    always_on        = true
    linux_fx_version = "DOCKER|${var.backend_docker_image_tag}"
  }

  app_settings = {
    DATABASE_CONNECTION_STRING               = var.database_connection_string
    NOTIFICATIONS_SERVICE_CONNECTION_STRING  = module.notifications.notifications_service_connection_string
    REDIS_CONNECTION_STRING                  = module.queue_system.redis_connection_string
    SIGNALR_CONNECTION_STRING                = module.realtime.signalr_primary_connection_string
    STORAGE_CONNECTION_STRING                = module.storage.storage_account_primary_key
    STORAGE_CONTAINER_URL                   = module.storage.storage_container_url 

  }

  identity {
    type = "SystemAssigned"
  }
  # Attach to the app subnet
  virtual_network_subnet_id = var.app_subnet_id
}
