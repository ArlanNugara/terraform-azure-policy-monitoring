// Import SAS token
data "azurerm_storage_account_sas" "sas" {
  connection_string = var.module_sa_cs
  https_only        = true
  start             = "2022-02-01T00:00:00Z"
  expiry            = "2020-02-01T00:00:00Z"
  resource_types {
    object    = true
    container = false
    service   = false
  }
  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }
  permissions {
    read    = true
    write   = false
    delete  = false
    list    = false
    add     = false
    create  = false
    update  = false
    process = false
  }
}

// Create the Function App here
resource "azurerm_function_app" "fa" {
  name                       = var.fa_name
  location                   = var.module_rg_location
  resource_group_name        = var.module_rg_name
  app_service_plan_id        = var.module_asp_id
  storage_account_name       = var.sa_name
  storage_account_access_key = var.module_sa_key
  tags                       = var.tags
  app_settings = {
    FUNCTIONS_WORKER_RUNTIME       = "python"
    FUNCTIONS_EXTENSION_VERSION    = "~4"
    APPINSIGHTS_INSTRUMENTATIONKEY = var.module_ai_ik
    WORKSPACE_ID                   = var.module_law_id
    WORKSPACE_KEY                  = var.module_law_sk
    WEBSITE_RUN_FROM_PACKAGE       = "https://${var.sa_name}.blob.core.windows.net/${var.sac_name}/${var.sacb_name}${data.azurerm_storage_account_sas.sas.sas}"
  }
}

// Output FA ID here
output "fa_id" {
  value = azurerm_function_app.fa.id
}

// Sleep for some time
resource "time_sleep" "wait_for_function_app" {
  create_duration = "300s"
  depends_on      = [azurerm_function_app.fa]
}