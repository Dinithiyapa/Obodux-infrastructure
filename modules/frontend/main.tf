resource "azurerm_app_service_plan" "frontend" {
  name                = "obodux-frontend-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"

  sku {
    tier = "Standard"
    size = "S1"
  }
}


resource "azurerm_linux_web_app" "frontend" {
  name                = "obodux-frontend"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_app_service_plan.frontend.id

  site_config {
    always_on = true
    linux_fx_version = "DOCKER|${var.frontend_docker_image_tag}" # Using variable
  }

  app_settings = {
    NEXT_PUBLIC_API_URL = var.backend_api_url
  }

  identity {
    type = "SystemAssigned"
  }
}
