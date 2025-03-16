resource "azurerm_communication_service" "notifications" {
  name                = var.notifications_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  data_location       = "United States"  # Choose appropriate data residency


}
