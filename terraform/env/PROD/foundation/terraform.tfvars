
rg = {
  rg1 = {
    rg_name  = "ibm-prod-rg"
    location = "East US"
  }
}

acr = {
  acr1 = {
    acr_name = "ibmprodacr"
    rg_key   = "rg1"
  }
}

uai = {
  uai1 = {
    uai_name = "ibmproduai"
    rg_key   = "rg1"
  }
}

github_actions_principal_id = "cb9eb7d0-76ea-48b9-ad94-5f4c955b1ed6"