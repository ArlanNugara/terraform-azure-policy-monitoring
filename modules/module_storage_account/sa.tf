// Create the Storage Account here
resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  resource_group_name      = var.module_rg_name
  location                 = var.module_rg_location
  account_tier             = var.sa_tier
  account_replication_type = var.sa_repl_type
  min_tls_version          = var.sa_tls_ver
  tags                     = var.tags
}

// Create the SA Container here
resource "azurerm_storage_container" "sac" {
  name                  = var.sac_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = var.sac_access_type
}

// Create the Blob here
resource "azurerm_storage_blob" "sacb" {
  name                   = var.sacb_name
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.sac.name
  type                   = var.sacb_type
  source                 = var.sacb_source
}

// Output the SA ID
output "sa_id" {
  value = azurerm_storage_account.sa.id
}

// Output the SA Key
output "sa_key" {
  value = azurerm_storage_account.sa.primary_access_key
}

// Output the SA Connection String
output "sa_cs" {
  value = azurerm_storage_account.sa.primary_connection_string
}