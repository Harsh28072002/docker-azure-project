output "rg_details" {

  value = {

    for key, rg in azurerm_resource_group.RG : key => {
      name     = rg.name
      location = rg.location

    }
  }



}