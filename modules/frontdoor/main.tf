resource "azurerm_cdn_frontdoor_profile" "fd_profile" {
  name                = var.name
  resource_group_name = var.rg_name
  sku_name            = "Standard_AzureFrontDoor"
}

resource "azurerm_cdn_frontdoor_endpoint" "fd_endpoint" {
  name                     = var.fd_endpoint
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.fd_profile.id
}

resource "azurerm_cdn_frontdoor_origin_group" "fd_og" {
  name                     = var.fd_og_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.fd_profile.id
}

resource "azurerm_cdn_frontdoor_origin" "fd_origin" {
  name                          = var.fd_origin
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.fd_og.id

  host_name = var.app_hostname
}