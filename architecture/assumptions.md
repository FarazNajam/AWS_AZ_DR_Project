# Assumptions

## General Assumptions

* Azure is the primary production environment.
* AWS is the disaster recovery environment.
* Infrastructure is managed through Terraform.
* GitHub acts as the source control platform.
* Infrastructure deployments are repeatable.

## Application Assumptions

* The Incident Tracking API is considered business critical.
* The application is stateless.
* Business data is stored outside the application tier.
* Application code is recoverable from source control.

## Networking Assumptions

* Public access will be minimized where practical.
* Private connectivity will be preferred for backend services.
* Network segmentation will be implemented using Azure networking controls.

## Security Assumptions

* Least privilege access will be applied.
* Managed identities will be preferred over stored credentials.
* Secrets will be stored in Key Vault.
* Logging and monitoring will be enabled where available.

## Disaster Recovery Assumptions

* AWS is not expected to process production traffic during normal operations.
* AWS resources may operate at reduced capacity during standby mode.
* Recovery procedures will be documented and tested.
* RTO and RPO values will be defined and validated during project execution.

## Monitoring Assumptions

* Health monitoring will be implemented.
* Alerting will be implemented.
* Failover decisions will require validation before activation.
