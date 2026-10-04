resource "azurerm_container_registry" "acr" {
  for_each            = var.acr
  name                = each.value.acr_name
  resource_group_name = var.rg[each.value.rg_key].name
  location            = var.rg[each.value.rg_key].location
  sku                 = "Premium"
  admin_enabled       = false

}

resource "azurerm_role_assignment" "acr_push" {

  for_each = var.acr

  scope                = azurerm_container_registry.acr[each.key].id
  role_definition_name = "AcrPush"
  principal_id         = var.github_actions_principal_id
}