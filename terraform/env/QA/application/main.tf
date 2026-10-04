data "terraform_remote_state" "foundation" {
  backend = "azurerm"

  config = {
    resource_group_name  = "backendRG"
    storage_account_name = "remotetfstate123"
    container_name       = "tfstatecontainer"
    key                  = "docker-azure-project-qa-foundation.tfstate"

    use_azuread_auth = true
    subscription_id  = "3e74e1e4-1e8b-42af-bd1a-9a434cdd4fa7"
    tenant_id        = "c974038c-b7c5-45f7-ab5b-fc3b5e2e92d1"
    client_id        = "4220db68-fb2c-4c74-9caf-7373ea190cf6"
  }
}



module "capp" {
  source = "../../../modules/containerapp"

  capp = var.capp

  rg = data.terraform_remote_state.foundation.outputs.rg_details

  acr_details = data.terraform_remote_state.foundation.outputs.acr_details

  uai_ids = data.terraform_remote_state.foundation.outputs.uai_ids
}