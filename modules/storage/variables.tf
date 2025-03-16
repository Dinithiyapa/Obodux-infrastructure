# General Variables
variable "location" {
  description = "Azure region where the Storage Account will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
}

# Storage Account Variables
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

# Container Variables
variable "container_name" {
  description = "The name of the Blob Storage container"
  type        = string
}

variable "public_access" {
  description = "Specifies the level of public access (blob, container, or private)"
  type        = string
}
