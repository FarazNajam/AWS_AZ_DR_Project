Azure Terraform Module Library
Overview

This repository contains reusable Terraform modules for deploying common Azure infrastructure components.

The goal of this project is to provide a scalable, environment-agnostic Infrastructure as Code (IaC) framework that supports deployment of Azure resources using Terraform modules and for_each patterns.

The modules are designed to support deployments ranging from a single resource instance to multiple resources across different environments and subscriptions.

Features
Modular Terraform design
Reusable Azure resource modules
Support for for_each deployments
Scalable map(object) variable patterns
Environment-agnostic deployments
Dependency mapping between resources
GitHub-friendly project structure
Suitable for Dev, Test, UAT, and Production environments
Current Modules
Module	Purpose
Resource Group	Deploy Azure Resource Groups
Network	Deploy VNets and Subnets
NSG	Deploy Network Security Groups
Route Table	Deploy Azure Route Tables
Public IP	Deploy Azure Public IP addresses
App Service	Deploy App Service Plans and Web Apps
Database	Deploy Azure SQL Servers and Databases
Front Door	Deploy Azure Front Door Profiles, Endpoints, Origin Groups, Origins and Routes
Storage Account	Deploy Azure Storage Accounts
Key Vault	Deploy Azure Key Vaults
App Configuration	Deploy Azure App Configuration Stores
Log Analytics	Deploy Log Analytics Workspaces
Service Bus	Deploy Service Bus Namespaces, Queues and Topics
Managed Identity	Deploy User Assigned Managed Identities
Azure Monitor Alerts	Deploy Metric and Activity Log Alerts
Repository Structure
.
├── main.tf
├── variables.tf
├── terraform.tfvars
├── modules
│   ├── resource_group
│   ├── network
│   ├── app_service
│   ├── database
│   ├── frontdoor
│   ├── storage_account
│   ├── key_vault
│   ├── app_config
│   ├── log_analytics
│   ├── service_bus
│   ├── nsg
│   ├── route_table
│   ├── public_ip
│   ├── managed_identity
│   └── monitor_alerts
Example Deployment
Resource Group
module "rg" {
  source   = "./modules/resource_group"

  rg_name  = "rg-prod-aue-01"
  location = "Australia East"

  tags = {
    environment = "prod"
    managed_by  = "terraform"
  }
}
Network
module "network" {
  source   = "./modules/network"

  rg_name  = module.rg.rg_name
  location = module.rg.location

  vnets    = var.vnets
  subnets  = var.subnets
}

Example variables:

vnets = {
  vnet_app = {
    name          = "vnet-prod-aue-01"
    address_space = ["10.0.0.0/16"]
    dns_servers   = ["10.0.0.4","10.0.0.5"]
  }
}

subnets = {
  subnet_app = {
    name              = "subnet-app"
    address_prefixes  = ["10.0.1.0/24"]
    vnet_key          = "vnet_app"
  }
}
App Service
module "app" {
  source = "./modules/app_service"

  rg_name      = module.rg.rg_name
  location     = module.rg.location

  app_services = var.app_services
}

Example variables:

app_services = {
  flask_app = {
    app_service_plan_name = "asp-prod-aue-01"
    app_service_name      = "app-prod-aue-01"
  }
}
Database
module "db" {
  source = "./modules/database"

  rg_name     = module.rg.rg_name
  location    = module.rg.location

  sqlservers  = var.sqlservers
  sqldatabases = var.sqldatabases
}
Front Door
module "frontdoor" {
  source = "./modules/frontdoor"

  rg_name      = module.rg.rg_name
  fd_profile   = var.fd_profile
  fd_endpoint  = var.fd_endpoint

  app_hostname = module.app.default_hostnames

  fd_og_name   = var.fd_og_name
  fd_route     = var.fd_route
}
Design Principles
Reusable Modules

Modules should be reusable across:

Development
Test
UAT
Production

without code changes.

Map(Object) Pattern

Modules are designed to use Terraform's map(object()) pattern to support deployment of multiple resources.

Example:

app_services = {
  app1 = {...}
  app2 = {...}
  app3 = {...}
}
Resource Relationships

Dependencies are modelled using key references.

Examples:

vnet_key
server_key
app_key

This allows resources to reference one another without hardcoding Azure resource names.

Future Enhancements
Private Endpoints
Application Gateway
Azure Firewall
Virtual Machines
Bastion
Recovery Services Vault
Backup Policies
Azure Kubernetes Service (AKS)
Azure Container Apps
Event Grid
Event Hub
Disclaimer

This project is intended for learning, lab environments, and reusable deployment patterns. Review all configurations before using in production environments.
