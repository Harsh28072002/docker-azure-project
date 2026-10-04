output "uai_ids" {

  value = {

    for key, uai in azurerm_user_assigned_identity.uai : key => {
      id           = uai.id
      principal_id = uai.principal_id

    }

  }

}