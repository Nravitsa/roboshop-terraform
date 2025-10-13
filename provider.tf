provider "azurerm" {
  features {}
  subscription_id = "838d8d5b-1157-4504-a71d-1ef48775bbe3"
}




terraform {
  backend "azurerm" {}
}
