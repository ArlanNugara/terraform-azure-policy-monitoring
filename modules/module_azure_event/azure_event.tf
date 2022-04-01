// Create the Event Grid Topic
resource "azurerm_eventgrid_topic" "egt" {
  name                = var.egt_name
  resource_group_name = var.module_rg_name
  location            = var.module_rg_location
  tags                = var.tags
}

// Create the Event Grid Subscription
resource "azurerm_eventgrid_event_subscription" "egs" {
  name                  = var.egs_name
  scope                 = azurerm_eventgrid_topic.egt.id
  event_delivery_schema = "EventGridSchema"
  azure_function_endpoint {
    function_id                       = "/subscriptions/98cc9cb7-7cd6-461a-bbac-c8b45e289205/resourceGroups/azure-policy-monitor/providers/Microsoft.Web/sites/azure-policy-monitor-fa/functions/PolicyMonitor"
    max_events_per_batch              = 1
    preferred_batch_size_in_kilobytes = 64
  }
}