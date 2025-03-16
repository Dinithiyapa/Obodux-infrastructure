variable "location" {
  description = "The Azure region where resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

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

variable "clerk_secret_key" {
  description = "Clerk secret key for authentication"
  type        = string
  sensitive   = true
}

variable "clerk_publishable_key" {
  description = "Clerk publishable key"
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



# Storage Variables
variable "storage_account_name" {
  description = "The name of the Azure Storage Account"
  type        = string
}

variable "storage_account_primary_key" {
  description = "The primary access key for the Storage Account"
  type        = string
  sensitive   = true
}

variable "storage_container_url" {
  description = "The name of the Blob Storage container"
  type        = string
}
