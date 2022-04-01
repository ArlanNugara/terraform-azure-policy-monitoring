// RG variables
variable "rg_name" {
  type        = string
  description = "RG Name"
}

variable "rg_location" {
  type        = string
  description = "RG Location"
}

variable "tags" {
  type        = map(string)
  description = "Resource Tags"
  default = {
    Env          = "Dev"
    "Created By" = "Terraform"
    Owner        = "Arlan Nugara"
    Region       = "Canada Central"
    Department   = "IT Operations"
    Customer     = "<Your Value here>"
  }
}

// LAW variables
variable "law_name" {
  type        = string
  description = "Log Analytics Workspace Name"
}

variable "law_sku" {
  type        = string
  description = "Log Analytics Workspace SKU"
}

variable "law_retention_period" {
  type        = string
  description = "Log Analytics Workspace Retention Period"
}

// ASP variables
variable "asp_name" {
  type        = string
  description = "App Service Plan Name"
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

// SA variables
variable "sa_name" {
  type        = string
  description = "Storage Account Name"
}

variable "sa_tier" {
  type        = string
  description = "Storage Account Tier"
}

variable "sa_repl_type" {
  type        = string
  description = "Storage Account Replication Type"
}

variable "sa_tls_ver" {
  type        = string
  description = "Storage Account TLS version"
}

variable "sac_name" {
  type        = string
  description = "Storage Account Container Name"
}

variable "sac_access_type" {
  type        = string
  description = "Storage Account Container Access Type"
}

variable "sacb_name" {
  type        = string
  description = "Storage Account Container Blob Name"
}

variable "sacb_type" {
  type        = string
  description = "Storage Account Container Blob Type"
}

variable "sacb_source" {
  type        = string
  description = "Storage Account Container Blob Source"
}

// AI variables
variable "ai_name" {
  type        = string
  description = "Application Insights Name"
}

variable "ai_type" {
  type        = string
  description = "Application Insights type"
}

// FA variable
variable "fa_name" {
  type        = string
  description = "Function App Name"
}

// EG variables
variable "egt_name" {
  type        = string
  description = "Event Grid Topic Name"
}

variable "egs_name" {
  type        = string
  description = "Event Grid Subscription Name"
}

// Alert variables
variable "mag_name" {
  type = string
}
variable "mag_short_name" {
  type = string
}

variable "mag_receiver_name" {
  type = string
}

variable "mag_receiver_email" {
  type = string
}

variable "alert_name" {
  type = string
}