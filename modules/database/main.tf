resource "azurerm_postgresql_flexible_server" "database" {
  name                   = "obodux-db"
  location               = var.location
  resource_group_name    = var.resource_group_name
  administrator_login    = var.db_admin_user
  administrator_password = var.db_admin_password
  sku_name               = "B_Standard_B1ms"
  storage_mb             = 32768  # 32 GB
  version                = "13"

  backup_retention_days         = 7
  geo_redundant_backup_enabled  = false

  delegated_subnet_id = var.database_subnet_id   # Attach to the database subnet
  private_dns_zone_id = null                     # Set to null if using built-in private DNS

  lifecycle {
    prevent_destroy = true  # Prevent accidental deletion
  }
}

resource "azurerm_postgresql_flexible_server_database" "db" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.database.id
  collation = "en_US.utf8"
  charset   = "UTF8"
}
