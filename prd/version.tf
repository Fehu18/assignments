terraform {

  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "storagerg"
    storage_account_name = "backendstore1206"
    container_name       = "storecont"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
  subscription_id = "dd841e0c-a76f-4d5d-ae2f-b0645b248ae5"
  tenant_id       = "6a7cad51-05b4-4ea3-8435-b2157749ac6b"
  object_id       = "4bbcfb7b-8415-4828-aee5-c19aa18500d4"
}
