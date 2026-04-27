resource "azurerm_app_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.rg_name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "as" {
  name                = var.app_service
  location            = var.location
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {}

  identity {
    type = "SystemAssigned"
  }
}