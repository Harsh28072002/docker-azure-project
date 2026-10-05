resource "azurerm_log_analytics_workspace" "law" {
  for_each            = var.capp
  name                = each.value.law_name
  location            = var.rg[each.value.rg_key].location
  resource_group_name = var.rg[each.value.rg_key].name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_app_environment" "CENV" {
  for_each                   = var.capp
  name                       = each.value.cenv_name
  location                   = var.rg[each.value.rg_key].location
  resource_group_name        = var.rg[each.value.rg_key].name
  logs_destination           = "log-analytics"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law[each.key].id
}

resource "azurerm_container_app" "CAPP" {
  for_each                     = var.capp
  name                         = each.value.capp_name
  container_app_environment_id = azurerm_container_app_environment.CENV[each.key].id
  resource_group_name          = var.rg[each.value.rg_key].name
  revision_mode                = "Single"

  ingress {
    external_enabled = true
    target_port      = 5000
    transport        = "auto"

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }




  depends_on = [
    azurerm_role_assignment.acr_pull
  ]

  identity {
    type         = "UserAssigned"
    identity_ids = [var.uai_ids[each.value.uai_key].id]
  }

  template {
    container {
      name   = "examplecontainerapp"
      image  = "${var.acr_details[each.value.acr_key].login_server}/docker-azure-app:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }

  registry {
    server   = var.acr_details[each.value.acr_key].login_server
    identity = var.uai_ids[each.value.uai_key].id
  }

}


resource "azurerm_role_assignment" "acr_pull" {
  for_each = var.capp

  scope                = var.acr_details[each.value.acr_key].id
  role_definition_name = "AcrPull"
  principal_id         = var.uai_ids[each.value.uai_key].principal_id
}