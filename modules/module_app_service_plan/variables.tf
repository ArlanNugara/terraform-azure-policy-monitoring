variable "asp_name" {
  type        = string
  description = "App Service Plan Name"
}

variable "module_rg_location" {
  type        = string
  description = "RG location"
}

variable "module_rg_name" {
  type        = string
  description = "RG Name"
}

variable "asp_kind" {
  type        = string
  description = "App Service Plan Kind"
}

variable "asp_tier" {
  type        = string
  description = "App Service Plan Tier"
}

variable "asp_size" {
  type        = string
  description = "App Service Plan Tier Size"
}

variable "tags" {
  type        = map(string)
  description = "Resource Tags"
}