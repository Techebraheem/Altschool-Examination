
variable "resource_group_name" {
  type        = string
  default = "Alx-Deploy"
}

variable "location" {
  type        = string
  default = "East US"
}

variable "acr_name" {
  type        = string
  default = "AlxcontainerRegistry"
}

variable "aks_name" {
  type        = string
  default = "alx-aks"
}

variable "sku" {
  type        = string
  default = "Standard"
}

variable "admin_enabled" {
  type    = bool
  default = false
}

variable "dns_prefix" {
  type        = string
  default = "alxaks"
}

variable "namespace" {
  type        = string
  default = "sockshop"
}

variable "carts_name" {
  type        = string
  default = "carts"
}