variable "egt_name" {
  type        = string
  description = "Event Grid Topic Name"
}

variable "module_rg_location" {
  type        = string
  description = "RG location"
}

variable "module_rg_name" {
  type        = string
  description = "RG Name"
}

variable "egs_name" {
  type        = string
  description = "Event Grid Subscription Name"
}

variable "tags" {
  type        = map(string)
  description = "Resource Tags"
}
