// RG variable values
rg_name     = "azure-policy-monitor"
rg_location = "canadacentral"

// LAW variable values
law_name             = "azure-policy-monitor-law"
law_sku              = "PerGB2018"
law_retention_period = 60

// ASP variable values
asp_name = "azure-policy-monitor-asp"
asp_kind = "Linux"
asp_tier = "Standard"
asp_size = "B1"

// SA variable values
sa_name         = "azurepolicymonitorsa"
sa_tier         = "Standard"
sa_repl_type    = "LRS"
sa_tls_ver      = "TLS1_2"
sac_name        = "azure-policy-monitor-sa-container"
sac_access_type = "private"
sacb_name       = "policy-monitor-python.zip"
sacb_type       = "Block"
sacb_source     = "policy-monitor-python.zip"

// AI variable values
ai_name = "azure-policy-monitor-ai"
ai_type = "web"

// Function App variable
fa_name = "azure-policy-monitor-fa"

// EG variable values
egt_name = "azure-policy-monitor-egt"
egs_name = "azure-policy-monitor-egs"

// Monitor variable values
mag_name           = "azure-policy-monitor-alert-group"
mag_receiver_name  = "<Your Value here>"
mag_receiver_email = "a<Your Value here>"
mag_short_name     = "policyalert"
alert_name         = "azure-policy-monitor-alert"