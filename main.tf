data "azurerm_resource_group" "lab" {
  name = "user-abticyikjhvj"
}

resource "random_string" "suffix" {
  length  = 8
  upper   = false
  special = false
}

resource "azurerm_storage_account" "lab" {
  name                     = "stlab${random_string.suffix.result}"
  resource_group_name      = data.azurerm_resource_group.lab.name
  location                 = data.azurerm_resource_group.lab.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Environment = "Lab"
    Owner       = "Hamid"
    ManagedBy   = "Terraform"
    Project     = "AzureLab"
  }
}
