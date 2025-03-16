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

# Database Module
module "database" {
  source              = "./modules/database"
  resource_group_name = module.resource_group.name
  location            = var.location
  database_subnet_id  = module.networking.database_subnet_id
}

# Queue System Module
module "queue_system" {
  source              = "./modules/queue_system"
  resource_group_name = module.resource_group.name
  location            = var.location
  redis_subnet_id     = module.networking.redis_subnet_id
}

# **Authentication Module (Clerk)**
module "auth" {
  source              = "./modules/auth"
  resource_group_name = module.resource_group.name
  location            = var.location
  clerk_secret_key    = var.clerk_secret_key
  clerk_publishable_key = var.clerk_publishable_key
  clerk_jwt_algorithm = var.clerk_jwt_algorithm
}

# **Notifications Module (Moved above Backend)**
module "notifications" {
  source              = "./modules/notifications"
  resource_group_name = module.resource_group.name
  location            = var.location
}

# Backend Module (Now references notifications)
module "backend" {
  source                     = "./modules/backend"
  resource_group_name        = module.resource_group.name
  location                   = var.location
  backend_docker_image_tag   = var.backend_docker_image_tag
  database_connection_string = module.database.database_connection_string
  redis_connection_string    = module.queue_system.redis_connection_string
  clerk_secret_key           = var.clerk_secret_key
  clerk_publishable_key      = var.clerk_publishable_key
  notifications_service_connection_string = module.notifications.notifications_service_connection_string
  app_subnet_id                       = module.networking.app_subnet_id
}

# Frontend Module (Now receives backend API URL)
module "frontend" {
  source              = "./modules/frontend"
  resource_group_name = module.resource_group.name
  location            = var.location
  backend_api_url     = module.backend.backend_api_url
  public_subnet_id    = module.networking.public_subnet_id
}

# Real-Time Communication Module
module "realtime_communication" {
  source              = "./modules/realtime_communication"
  resource_group_name = module.resource_group.name
  location            = var.location
}

# File Storage Module
module "file_storage" {
  source              = "./modules/file_storage"
  resource_group_name = module.resource_group.name
  location            = var.location
}
