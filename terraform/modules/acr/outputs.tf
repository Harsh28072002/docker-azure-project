output "acr_details" {

  value = {

    for key, acr in azurerm_container_registry.acr : key => {
      login_server = acr.login_server
      id           = acr.id

    }
  }

}
