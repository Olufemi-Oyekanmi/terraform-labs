terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "lab1" {
  name = "terraform-lab1"
  location = "West Europe"
  tags = {
    "environment" = "trianing"
  }
}
