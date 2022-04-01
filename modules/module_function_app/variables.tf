variable "fa_name" {
  type        = string
  description = "Function App Name"
}

variable "module_rg_location" {
  type        = string
  description = "RG location"
}

variable "module_rg_name" {
  type        = string
  description = "RG Name"
}

variable "module_asp_id" {
  type        = string
  description = "App Service Plan"
}

variable "sa_name" {
  type        = string
  description = "Storage Account Name"
}

variable "module_sa_key" {
  type        = string
  description = "Storage Account Access Key"
}

variable "tags" {
  type        = map(string)
  description = "Resource Tags"
}

variable "module_ai_ik" {
  type        = string
  description = "Application Insights Instrumentation Key"
}

variable "module_law_id" {
  type        = string
  description = "Log Analytics Workspace ID"
}

variable "module_law_sk" {
  type        = string
  description = "Log Analytics Workspace Shared Key"
}

variable "sac_name" {
  type        = string
  description = "Storage Account Container Name"
}

variable "sacb_name" {
  type        = string
  description = "Storage Account Container Blob Name"
}

variable "module_sa_cs" {
  type        = string
  description = "Storage Account Connection Strings"
}
