variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where Redis will be deployed"
  type        = string
}

variable "redis_sku" {
  description = "Redis pricing tier"
  type        = string
  default     = "Premium"
}

variable "storage_account_connection_string" {
  description = "Storage account connection string for Redis persistence"
  type        = string
}

# Redis Configuration Variables
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
