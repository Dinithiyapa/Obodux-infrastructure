resource "azurerm_linux_web_app" "backend_auth" {
  name                = var.backend_app_name
  location            = var.location
  resource_group_name = var.resource_group_name

  app_settings = {
    CLERK_PUBLISHABLE_KEY = var.clerk_publishable_key
    CLERK_SECRET_KEY      = var.clerk_secret_key
    CLERK_JWT_ALGORITHM   = var.clerk_jwt_algorithm
  }
}
