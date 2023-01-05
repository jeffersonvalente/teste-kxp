terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true

  //subscription_id = "aebeeba9-42f5-4962-b801-6d11f6be7be6"
  //tenant_id       = "7ea6e83d-d26f-4af2-b4f7-43165ddf2451"
  //client_id       = "e98648bb-a7af-496f-96c4-ed43b2c61253"
  //client_secret   = "j958Q~C-ByeJfeCNZHp1zcjjSnIAsfmMVpi6ncmK"
}

resource "random_string" "random_suffix" {
  length  = 3
  special = false
  upper   = false
}

locals {
  unique_person_name = "${var.person_name}${random_string.random_suffix.result}"
}

module "storage" {
  source             = "./modules/storage"
  location           = var.location
  rg_name            = var.rg_name
  unique_person_name = local.unique_person_name
}

module "apps" {
  source             = "./modules/apps"
  location           = var.location
  rg_name            = var.rg_name
  unique_person_name = local.unique_person_name
}

module "database" {
  source             = "./modules/database"
  location           = var.location
  rg_name            = var.rg_name
  unique_person_name = local.unique_person_name
  db_username        = var.db_username
  db_password        = var.db_password
}
