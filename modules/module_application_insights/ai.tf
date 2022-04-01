// Create the Application Insights here
resource "azurerm_application_insights" "ai" {
  name                = var.ai_name
  location            = var.module_rg_location
  resource_group_name = var.module_rg_name
  workspace_id        = var.module_law_id
  application_type    = var.ai_type
  tags                = var.tags
}

// Output the AI ID
output "ai_id" {
  value = azurerm_application_insights.ai.id
}

// Output the AI Instrumentation Key
output "ai_ik" {
  value = azurerm_application_insights.ai.instrumentation_key
}