variable "ai_name" {
  type        = string
  description = "Application Insights Name"
}

variable "module_rg_location" {
  type        = string
  description = "RG location"
}

variable "module_rg_name" {
  type        = string
  description = "RG Name"
}

variable "module_law_id" {
  type        = string
  description = "Log Analytics Workspace ID"
}

variable "ai_type" {
  type        = string
  description = "Application Insights type"
}

variable "tags" {
  type        = map(string)
  description = "Resource Tags"
}