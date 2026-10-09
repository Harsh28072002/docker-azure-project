rg = {
  rg1 = {
    rg_name  = "ibm-qa-rg"
    location = "East US 2"
  }
}

acr = {
  acr1 = {
    acr_name = "ibmqaacr"
    rg_key   = "rg1"
  }
}

uai = {
  uai1 = {
    uai_name = "ibmqauai"
    rg_key   = "rg1"
  }
}

github_actions_principal_id = "cb9eb7d0-76ea-48b9-ad94-5f4c955b1ed6"