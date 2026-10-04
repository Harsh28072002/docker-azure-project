resource "azurerm_user_assigned_identity" "uai" {
  for_each            = var.uai
  location            = var.rg[each.value.rg_key].location
  name                = each.value.uai_name
  resource_group_name = var.rg[each.value.rg_key].name
}