variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "backend_app_name" {
  description = "Backend app name for authentication integration"
  type        = string
}

variable "clerk_publishable_key" {
  description = "Clerk publishable key"
  type        = string
}

variable "clerk_secret_key" {
  description = "Clerk secret key"
  type        = string
}

variable "clerk_jwt_algorithm" {
  description = "Algorithm used for Clerk JWT"
  type        = string
  default     = "RS256"
}
