module "rg" {
  source   = "../../modules/resource_group"
  resource_group_name     = "rg-prod-app"
  location = "Australia East"
  tags     = local.tags
}

module "network" {
  source   = "../../modules/network"
  rg_name  = module.rg.name
  location = module.rg.location
}

module "app" {
  source   = "../../modules/app_service"
  rg_name  = module.rg.name
  location = module.rg.location

  app_name  = "prod-app-service"
  plan_name = "prod-plan"
}

module "db" {
  source   = "../../modules/database"
  rg_name  = module.rg.name
  location = module.rg.location

  server_name = "prod-sql-server"
  db_name     = "prod-db"
}

module "frontdoor" {
  source   = "../../modules/frontdoor"
  rg_name  = module.rg.name

  name         = "prod-frontdoor"
  app_hostname = module.app.default_hostname
}