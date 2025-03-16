variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

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
