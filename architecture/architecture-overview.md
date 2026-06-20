# Architecture Overview

## Purpose

This project demonstrates a multi-cloud disaster recovery solution using Microsoft Azure as the primary environment and Amazon Web Services (AWS) as the disaster recovery environment.

The solution is designed to showcase cloud architecture, infrastructure as code, security assessment, monitoring, availability, and disaster recovery capabilities using real cloud services.

## Business Scenario

The application represents a business-critical Incident Tracking API.

The API is hosted in Azure and provides services for managing incident records and associated application data.

In the event of a significant Azure outage, the application can be recovered in AWS using a warm standby disaster recovery model.

## Architecture Principles

The solution is designed around the following principles:

* Infrastructure as Code
* Security by Design
* Least Privilege Access
* Monitoring and Observability
* Disaster Recovery Readiness
* Repeatable Deployments
* Multi-Cloud Resilience

## Primary Environment

Azure serves as the active production environment.

Core services include:

* Azure Front Door
* Azure App Service
* Azure SQL Database
* Azure Key Vault
* Azure App Configuration
* Azure Storage Account
* Azure Monitor
* Application Insights

## Disaster Recovery Environment

AWS serves as the warm standby environment.

The AWS environment is intended to support recovery of the application and associated data if Azure becomes unavailable.

Recovery mechanisms, failover processes, and validation procedures will be developed and tested throughout the project lifecycle.

## Security Assessment Approach

Each component will be assessed across the following domains:

* Identity
* Networking
* Data Protection
* Monitoring
* Logging
* Availability
* Disaster Recovery
* Cost Optimization

Findings and recommendations will be documented separately within the assessments section of the repository.

## Future Enhancements

Planned enhancements include:

* Managed Identity
* Key Vault integration
* App Configuration integration
* Azure SQL integration
* Storage Account integration
* Service Bus integration
* API Management integration
* AWS failover automation
* DR testing and validation
* STRIDE threat modelling
