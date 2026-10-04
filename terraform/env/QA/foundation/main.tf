module "rg" {

  source = "../../../modules/rg"

  rg = var.rg
}

module "acr" {

  source = "../../../modules/acr"

  acr = var.acr
  rg  = module.rg.rg_details

  github_actions_principal_id = var.github_actions_principal_id
}

module "uai" {

  source = "../../../modules/identity"

  uai = var.uai
  rg  = module.rg.rg_details
}
