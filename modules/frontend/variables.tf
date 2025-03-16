variable "location" {
  description = "The Azure region to deploy resources into."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "backend_api_url" {
  description = "The URL of the backend API."
  type        = string
}

variable "frontend_docker_image_tag"{
  description = "The image name and tag of the docker image to deploy"
  type = string
}

variable "public_subnet_id" {
  description = "The ID of the subnet where the frontend will be deployed."
  type        = string
}
