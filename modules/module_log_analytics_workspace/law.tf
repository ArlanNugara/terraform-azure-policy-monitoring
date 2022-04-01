// Create the LAW here
resource "azurerm_log_analytics_workspace" "law" {
  name                = var.law_name
  location            = var.module_rg_location
  resource_group_name = var.module_rg_name
  sku                 = var.law_sku
  retention_in_days   = var.law_retention_period
  tags                = var.tags
}

// Output the LAW ID
output "law_id" {
  value = azurerm_log_analytics_workspace.law.id
}

// Output the LAW Shared Key
output "law_sk" {
  value = azurerm_log_analytics_workspace.law.primary_shared_key
}
