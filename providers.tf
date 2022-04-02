terraform {
  required_version = "~> 1.1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.93.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "<Your Value here>"
    storage_account_name = "<Your Value here>"
    container_name       = "<Your Value here>"
    key                  = "<Your Value here>"
  }
}

provider "azurerm" {
  features {}
}
