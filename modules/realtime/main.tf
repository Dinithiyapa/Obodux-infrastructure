resource "azurerm_signalr_service" "signalr" {
  name                = var.signalr_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.sku_name
    capacity = var.sku_capacity
  }

  # Define the service mode (Default, Classic, Serverless)
  service_mode = "Default"

  # Enable TLS for secure connections
  tls_client_cert_enabled = true

  # CORS Configuration (Optional)
  cors {
    allowed_origins = var.allowed_origins
  }

  # Public Network Access
  public_network_access_enabled = var.public_network_access_enabled

  # Enable Logging
  connectivity_logs_enabled = var.connectivity_logs_enabled
  messaging_logs_enabled    = var.messaging_logs_enabled

  # Upstream Configuration (Optional)
  upstream_endpoint {
    category_pattern = ["connections", "messages"]
    event_pattern    = ["*"]
    hub_pattern      = var.hub_pattern
    url_template     = var.upstream_url
  }
}
