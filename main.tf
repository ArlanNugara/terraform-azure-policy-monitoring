// Create the RG
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
  tags     = var.tags
}

// Create the Log Analytics Workspaces
module "module_law" {
  source               = "./modules/module_log_analytics_workspace"
  law_name             = var.law_name
  module_rg_location   = azurerm_resource_group.rg.location
  module_rg_name       = azurerm_resource_group.rg.name
  law_sku              = var.law_sku
  law_retention_period = var.law_retention_period
  tags                 = var.tags
}

// Create the Storage Accounts
module "module_sa" {
  source             = "./modules/module_storage_account"
  sa_name            = var.sa_name
  module_rg_location = azurerm_resource_group.rg.location
  module_rg_name     = azurerm_resource_group.rg.name
  sa_tier            = var.sa_tier
  sa_repl_type       = var.sa_repl_type
  sa_tls_ver         = var.sa_tls_ver
  tags               = var.tags
  sac_name           = var.sac_name
  sac_access_type    = var.sac_access_type
  sacb_name          = var.sacb_name
  sacb_type          = var.sacb_type
  sacb_source        = var.sacb_source
}

// Create the App Service Plan
module "module_asp" {
  source             = "./modules/module_app_service_plan"
  asp_name           = var.asp_name
  module_rg_location = azurerm_resource_group.rg.location
  module_rg_name     = azurerm_resource_group.rg.name
  asp_kind           = var.asp_kind
  asp_tier           = var.asp_tier
  asp_size           = var.asp_size
  tags               = var.tags
}

// Create the Application Insights
module "module_ai" {
  source             = "./modules/module_application_insights"
  ai_name            = var.ai_name
  module_rg_location = azurerm_resource_group.rg.location
  module_rg_name     = azurerm_resource_group.rg.name
  module_law_id      = module.module_law.law_id
  ai_type            = var.ai_type
  tags               = var.tags
}

// Create the Function App
module "module_fa" {
  source             = "./modules/module_function_app"
  fa_name            = var.fa_name
  module_rg_location = azurerm_resource_group.rg.location
  module_rg_name     = azurerm_resource_group.rg.name
  module_asp_id      = module.module_asp.asp_id
  sa_name            = var.sa_name
  module_sa_cs       = module.module_sa.sa_cs
  module_sa_key      = module.module_sa.sa_key
  tags               = var.tags
  module_ai_ik       = module.module_ai.ai_ik
  module_law_id      = module.module_law.law_id
  module_law_sk      = module.module_law.law_sk
  sac_name           = var.sac_name
  sacb_name          = var.sacb_name
}

/*
// Create the Events
module "module_ev" {
  source             = "./modules/module_azure_event"
  egt_name           = var.egt_name
  module_rg_name     = azurerm_resource_group.rg.name
  module_rg_location = azurerm_resource_group.rg.location
  egs_name           = var.egs_name
  tags               = var.tags
}

// Create the Monitor Alerts
module "module_alert" {
  source             = "./modules/module_monitor_alert"
  mag_name           = var.mag_name
  module_rg_location = azurerm_resource_group.rg.location
  module_rg_name     = azurerm_resource_group.rg.name
  mag_receiver_name  = var.mag_receiver_name
  mag_receiver_email = var.mag_receiver_email
  alert_name         = var.alert_name
  module_ai_id       = module.module_ai.ai_id
  mag_short_name     = var.mag_short_name
  tags               = var.tags
}
*/