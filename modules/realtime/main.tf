# SignalR Service
resource "azurerm_signalr_service" "signalr" {
  name                = var.signalr_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.sku_name
    capacity = var.sku_capacity
  }

  # Enable WebSocket and REST APIs
  features {
    flag  = "ServiceMode"
    value = "Default"
  }

  # Enforce secure connections
  tls_client_cert_enabled = true
}
