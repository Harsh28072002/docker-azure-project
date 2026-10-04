terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "backendRG"
    storage_account_name = "remotetfstate123"
    container_name       = "tfstatecontainer"

    key = "docker-azure-project-qa-foundation.tfstate"

    use_oidc         = true
    use_azuread_auth = true

    subscription_id = "3e74e1e4-1e8b-42af-bd1a-9a434cdd4fa7"
    tenant_id       = "c974038c-b7c5-45f7-ab5b-fc3b5e2e92d1"
    client_id       = "4220db68-fb2c-4c74-9caf-7373ea190cf6"
  }
}

provider "azurerm" {
  features {}

  subscription_id = "b0df8476-0d0b-4db4-be4e-0cf3fc399f83"
  tenant_id       = "c974038c-b7c5-45f7-ab5b-fc3b5e2e92d1"
}