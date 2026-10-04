
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "backendRG"
    storage_account_name = "remotetfstate123"
    container_name       = "tfstatecontainer"

    # Separate state file for PROD Application
    key = "docker-azure-project-prod-application.tfstate"

    use_oidc         = true
    use_azuread_auth = true

    subscription_id = "3e74e1e4-1e8b-42af-bd1a-9a434cdd4fa7"
    tenant_id       = "c974038c-b7c5-45f7-ab5b-fc3b5e2e92d1"
    client_id       = "4220db68-fb2c-4c74-9caf-7373ea190cf6"
  }
}

provider "azurerm" {
  features {}

  subscription_id = "4070b305-7317-4a1f-9c79-f660869be54f"
  tenant_id       = "c974038c-b7c5-45f7-ab5b-fc3b5e2e92d1"
}