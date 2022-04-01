variable "sa_name" {
  type        = string
  description = "Storage Account Name"
}

variable "module_rg_location" {
  type        = string
  description = "RG location"
}

variable "module_rg_name" {
  type        = string
  description = "RG Name"
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

variable "tags" {
  type        = map(string)
  description = "Resource Tags"
}
