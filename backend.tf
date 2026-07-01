terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    container_name       = "tfstate"
    key                  = "lab.tfstate"
  }
}
