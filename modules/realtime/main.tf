resource "azurerm_signalr_service" "signalr" {
  name                = "obodux-signalr"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = "Standard_S1"
    capacity = 1
  }
}
