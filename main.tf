terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"
}

provider "azurerm" {
  features {}
}

# Resource Group Module
module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
}

# Networking Module
module "networking" {
  source              = "./modules/networking"
  resource_group_name = module.resource_group.name
  location            = var.location
}

# File Storage Module
module "file_storage" {
  source                  = "./modules/file_storage"
  resource_group_name     = module.resource_group.name
  location                = var.location
  storage_account_name    = var.storage_account_name
  storage_tier            = var.storage_tier
  replication_type        = var.replication_type
  delete_retention_days   = var.delete_retention_days
  container_name          = var.container_name
  public_access           = var.public_access
}

# Database Module
module "database" {
  source              = "./modules/database"
  resource_group_name = module.resource_group.name
  location            = var.location
  database_subnet_id  = module.networking.database_subnet_id
  db_admin_user       = var.db_admin_user
  db_admin_password   = var.db_admin_password
  database_name       = var.database_name
}

# Queue System Module
module "queue_system" {
  source              = "./modules/queue_system"
  resource_group_name = module.resource_group.name
  location            = var.location
  redis_sku      = var.redis_sku
  redis_capacity = var.redis_capacity
  redis_family   = var.redis_family
  redis_subnet_id     = module.networking.redis_subnet_id
  storage_account_connection_string = module.storage.storage_account_connection_string
}


# **Notifications Module 
module "notifications" {
  source              = "./modules/notifications"
  resource_group_name = module.resource_group.name
  location            = var.location
  notifications_service_name = var.notifications_service_name
  data_location          = var.data_location
}

# Backend Module 
module "backend" {
  source                     = "./modules/backend"
  resource_group_name        = module.resource_group.name
  location                   = var.location
  app_subnet_id              = module.networking.app_subnet_id

  # Docker Image
  backend_docker_image_tag   = var.backend_docker_image_tag

  # Database & Redis
  database_connection_string = module.database.database_connection_string
  redis_connection_string    = module.queue_system.redis_connection_string

  # Notifications Service
  notifications_service_connection_string = module.notifications.notifications_service_connection_string

  # Storage
  storage_account_name       = var.storage_account_name
  storage_account_primary_key = var.storage_account_primary_key
  storage_container_name     = var.storage_container_name
}


# Frontend Module 
module "frontend" {
  source              = "./modules/frontend"
  resource_group_name = module.resource_group.name
  location            = var.location
  backend_api_url     = module.backend.backend_api_url
  public_subnet_id    = module.networking.public_subnet_id
  frontend_docker_image_tag = var.frontend_docker_image_tag
}

# Real-Time Communication Module
module "realtime_communication" {
  source              = "./modules/realtime"
  resource_group_name = module.resource_group.name
  location            = var.location
  signalr_name        = var.signalr_name
  sku_name            = var.sku_name
  sku_capacity        = var.sku_capacity
  allowed_origins     = var.allowed_origins
  public_network_access_enabled = var.public_network_access_enabled
  connectivity_logs_enabled     = var.connectivity_logs_enabled
  messaging_logs_enabled        = var.messaging_logs_enabled
  upstream_url        = var.upstream_url
  hub_pattern         = var.hub_pattern
}


