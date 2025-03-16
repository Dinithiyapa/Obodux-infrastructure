variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

# Database Variables
variable "db_admin_user" {
  description = "Database admin username"
  type        = string
}

variable "db_admin_password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Name of the PostgreSQL database"
  type        = string
}

variable "database_subnet_id" {
  description = "The ID of the subnet where the database will be deployed."
  type        = string
}

# Queue System Variables
variable "redis_capacity" {
  description = "The size of the Redis cache instance (Premium tier supports clustering)"
  type        = number
}

variable "redis_family" {
  description = "The Redis family type (P for Premium)"
  type        = string
}

variable "redis_sku" {
  description = "The SKU for Redis Cache (Premium required for persistence)"
  type        = string
}

variable "redis_subnet_id" {
  description = "The ID of the subnet where Redis will be deployed."
  type        = string
}

variable "storage_account_connection_string" {
  description = "Storage account connection string for Redis persistence"
  type        = string
}

# Notification Variables
variable "notifications_service_name" {
  type        = string
  description = "The name of the Azure Communication Services instance"
}

variable "data_location" {
  description = "The data residency location for the communication service."
  type        = string
}

# Storage Variables
variable "storage_account_name" {
  description = "The name of the Azure Storage Account (must be globally unique)"
  type        = string
}

variable "storage_tier" {
  description = "The storage tier to use (Hot, Cool, or Archive)"
  type        = string
}

variable "replication_type" {
  description = "The replication type (LRS, GRS, RA-GRS, ZRS)"
  type        = string
}

variable "delete_retention_days" {
  description = "Number of days to retain deleted blobs"
  type        = number
}

# Container Variables
variable "container_name" {
  description = "The name of the Blob Storage container"
  type        = string
}

variable "public_access" {
  description = "Specifies the level of public access (blob, container, or private)"
  type        = string
}

# Backend Variables
variable "app_subnet_id" {
  description = "The ID of the subnet where the backend will be deployed."
  type        = string
}

variable "backend_app_name" {
  description = "Name of the backend application"
  type        = string
}

variable "backend_docker_image_tag" {
  description = "Docker image tag for backend"
  type        = string
}

variable "database_connection_string" {
  description = "PostgreSQL connection string"
  type        = string
}

variable "redis_connection_string" {
  description = "Redis connection string for BullMQ"
  type        = string
}

variable "notifications_service_connection_string" {
  description = "Azure Communication Services connection string"
  type        = string
}

variable "storage_account_primary_key" {
  description = "The primary access key for the Storage Account"
  type        = string
  sensitive   = true
}

variable "storage_container_name" {
  description = "The name of the Blob Storage container"
  type        = string
}

# Frontend Variables
variable "backend_api_url" {
  description = "The URL of the backend API."
  type        = string
}

variable "frontend_docker_image_tag" {
  description = "The image name and tag of the docker image to deploy"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the subnet where the frontend will be deployed."
  type        = string
}

# Real-time Communication Module Variables
variable "signalr_name" {
  description = "The name of the Azure SignalR instance"
  type        = string
}

variable "sku_name" {
  description = "The SKU tier for SignalR (e.g., Free, Standard)"
  type        = string
}

variable "sku_capacity" {
  description = "The capacity of the SignalR instance (e.g., 1, 2, etc.)"
  type        = number
}

variable "allowed_origins" {
  description = "Allowed origins for SignalR cross-origin requests"
  type        = list(string)
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for SignalR"
  type        = bool
}

variable "connectivity_logs_enabled" {
  description = "Enable logs for SignalR connectivity"
  type        = bool
}

variable "messaging_logs_enabled" {
  description = "Enable logs for SignalR messaging"
  type        = bool
}

variable "upstream_url" {
  description = "The upstream service URL for SignalR"
  type        = string
}

variable "hub_pattern" {
  description = "The hub pattern for SignalR"
  type        = string
}
