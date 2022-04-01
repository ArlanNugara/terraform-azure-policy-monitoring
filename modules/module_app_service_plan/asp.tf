// Create Azure App Service Plan
resource "azurerm_app_service_plan" "asp" {
  name                = var.asp_name
  location            = var.module_rg_location
  resource_group_name = var.module_rg_name
  kind                = var.asp_kind
  reserved            = true
  sku {
    tier     = var.asp_tier
    size     = var.asp_size
    capacity = 1
  }
  tags = var.tags
}

// Output the ASP ID
output "asp_id" {
  value = azurerm_app_service_plan.asp.id
}