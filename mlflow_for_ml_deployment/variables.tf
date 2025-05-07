variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "app_name" {
  description = "The name of the Application"
  type        = string
}

variable "docker_registry_username" {
  description = "The username for the Docker registry"
  type        = string
}

variable "docker_registry_password" {
  description = "The password for the Docker registry"
  type        = string
}

# variable "docker_image_name" {
#   description = "The name of the Docker image"
#   type        = string
# }