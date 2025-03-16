# Create an Azure Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.replication_type
  access_tier              = var.storage_tier

  enable_https_traffic_only = true  # Enforce secure access
  min_tls_version           = "TLS1_2"

  blob_properties {
    delete_retention_policy {
      days = 7  # Soft delete retention period
    }
  }
}

# Create a Blob Storage Container
resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = var.public_access
}
