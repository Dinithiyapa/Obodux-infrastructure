resource "azurerm_signalr_service" "signalr" {
  name                = var.signalr_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.sku_name
    capacity = var.sku_capacity
  }

  # Service mode (Default / Classic / Serverless)
  service_mode = "Default"

  # Enable TLS for secure connections
  tls_client_cert_enabled = true

  # Optional: Enable CORS
  cors {
    allowed_origins = ["https://myfrontend.com", "https://anotherdomain.com"]
  }

  # Optional: Disable public network access 
  public_network_access_enabled = false

  # Optional: Enable logging
  connectivity_logs_enabled = true
  messaging_logs_enabled    = true

  # Optional: Upstream endpoints 
  upstream_endpoint {
    category_pattern = ["connections", "messages"]
    event_pattern    = ["*"]
    hub_pattern      = ["hub1"]
    url_template     = "https://mybackend.com"
  }
}
