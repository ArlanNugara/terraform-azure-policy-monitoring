variable "law_name" {
  type        = string
  description = "Log Analytics Workspace Name"
}

variable "module_rg_location" {
  type        = string
  description = "RG location"
}

variable "module_rg_name" {
  type        = string
  description = "RG Name"
}

variable "law_sku" {
  type        = string
  description = "Log Analytics Workspace SKU"
}

variable "law_retention_period" {
  type        = string
  description = "Log Analytics Workspace Retention Period"
}

variable "tags" {
  type        = map(string)
  description = "Resource Tags"
}