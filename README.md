# Multi-Cloud Disaster Recovery Platform (Azure Primary / AWS Warm Standby)

## Overview

This project demonstrates the design, deployment, security assessment, and disaster recovery (DR) capabilities of a modern cloud-hosted application across Microsoft Azure and Amazon Web Services (AWS).

The solution is designed using an **Active-Warm Standby** architecture:

* **Azure** serves as the primary production environment.
* **AWS** serves as the warm standby disaster recovery environment.
* Infrastructure is deployed and managed using **Terraform Infrastructure as Code (IaC)**.
* The solution includes security, availability, monitoring, and disaster recovery considerations for every major component.

The objective is not only to deploy infrastructure and applications, but also to evaluate the operational readiness of the platform through security reviews, resilience testing, and disaster recovery exercises.

---

## Project Goals

### Infrastructure as Code

* Deploy Azure infrastructure using Terraform modules.
* Deploy AWS disaster recovery infrastructure using Terraform.
* Maintain reusable, modular, and version-controlled infrastructure.

### Disaster Recovery

* Implement a multi-cloud DR strategy.
* Use Azure as the active production environment.
* Use AWS as a warm standby environment.
* Define and validate Recovery Time Objectives (RTO) and Recovery Point Objectives (RPO).
* Conduct DR drills and document outcomes.

### Security

Assess each component across multiple security domains including:

* Identity and access management
* Network security
* Data protection
* Monitoring and logging
* Availability and resilience
* Disaster recovery readiness

### Operational Readiness

* Implement monitoring and alerting.
* Establish logging and observability.
* Create operational runbooks.
* Document recovery procedures and lessons learned.

---

## High-Level Architecture

```text
Users
   │
   ▼
Azure Front Door
   │
   ▼
Azure Application Services
   │
   ▼
Azure Data Services
   │
   ▼
Azure Monitoring & Logging
```

### Disaster Recovery Environment

```text
Azure Primary Environment
           │
           ▼
Failure Detection Mechanism
           │
           ▼
DR Decision / Trigger
           │
           ▼
AWS Warm Standby Environment
           │
           ▼
Traffic Redirection
```

The exact implementation of failure detection, validation, and failover triggering will evolve throughout the project and will be documented as the design matures.

---

## Core Components

### Azure (Primary)

Examples of services that may be used:

* Resource Groups
* Virtual Networks
* Network Security Groups
* Azure Front Door
* App Service Plans
* App Services
* Azure SQL Database
* Azure Key Vault
* Azure App Configuration
* Azure Storage Accounts
* Azure Monitor
* Application Insights
* Service Bus
* API Management

### AWS (Warm Standby)

Examples of services that may be used:

* VPC
* EC2
* RDS
* Route 53
* CloudWatch
* S3
* IAM

---

## Security Assessment Framework

Each component will be assessed using a common framework.

### Identity

Review:

* RBAC assignments
* Managed identities
* Service principals
* Least privilege principles

### Networking

Review:

* Public exposure
* Private endpoints
* Network segmentation
* Security groups and firewall rules

### Data Protection

Review:

* Encryption at rest
* Encryption in transit
* Secret management
* Backup protection

### Monitoring & Logging

Review:

* Diagnostic settings
* Centralized logging
* Alerting configuration
* Audit trails

### Availability

Review:

* High availability capabilities
* Redundancy options
* Scaling options
* Single points of failure

### Disaster Recovery

Review:

* Recovery methods
* Recovery dependencies
* Recovery Time Objective (RTO)
* Recovery Point Objective (RPO)
* Failover procedures

---

## Project Phases

### Phase 1 – Primary Environment Validation

* Deploy Azure infrastructure
* Deploy application workload
* Validate application connectivity
* Validate database connectivity

### Phase 2 – Architecture and Security Assessment

* Identify single points of failure
* Assess security posture
* Review monitoring and observability
* Review backup and recovery capabilities

### Phase 3 – Data Protection

* Implement backup strategy
* Validate restore procedures
* Define RPO targets

### Phase 4 – AWS Disaster Recovery Environment

* Deploy warm standby infrastructure
* Restore and synchronize data
* Validate application readiness

### Phase 5 – Monitoring and Alerting

* Configure monitoring
* Configure alerting
* Establish operational visibility

### Phase 6 – Failure Detection and DR Trigger Design

* Design failure detection process
* Design validation workflow
* Define failover decision process

### Phase 7 – Failover Implementation

* Deploy or activate DR resources
* Restore services as required
* Redirect traffic
* Validate application functionality

### Phase 8 – Disaster Recovery Drills

* Simulate production outages
* Execute recovery procedures
* Measure recovery performance

### Phase 9 – Continuous Improvement

* Document findings
* Record achieved RTO/RPO
* Identify gaps
* Implement improvements

---

## Repository Structure

```text
.
├── modules/
├── environments/
├── flask_app/
├── diagrams/
├── docs/
├── runbooks/
├── scripts/
└── pipelines/
```

---

## Success Criteria

The project will be considered successful when:

* Azure production infrastructure is fully operational.
* AWS warm standby environment is available and recoverable.
* Infrastructure can be recreated from Terraform.
* Monitoring and alerting are operational.
* Security assessments have been completed for all major components.
* DR testing has been successfully performed.
* RTO and RPO have been measured and documented.
* Recovery procedures are repeatable and documented.

```
```
