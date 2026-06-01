terraform  {
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "4.59.0"
      }
    }
}


provider "azurerm" {
  features {}
  subscription_id = "e9353bd8-5b79-4a91-9500-36beb348477e"
}