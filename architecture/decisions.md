# Architecture Decisions

## ADR-001: Multi-Cloud Disaster Recovery

### Decision

Use Azure as the primary cloud platform and AWS as the disaster recovery platform.

### Reason

* Demonstrates multi-cloud skills.
* Avoids cloud provider dependency.
* Supports disaster recovery objectives.

### Trade-Offs

* Increased complexity.
* Increased operational overhead.
* Additional cost.

---

## ADR-002: Active / Warm Standby Model

### Decision

Use Active (Azure) and Warm Standby (AWS).

### Reason

* Lower cost than Active/Active.
* Simpler operational model.
* Suitable for learning DR principles.

### Trade-Offs

* Higher recovery time than Active/Active.
* Requires recovery procedures.

---

## ADR-003: Terraform as Source of Truth

### Decision

All infrastructure will be deployed using Terraform.

### Reason

* Repeatable deployments.
* Version control.
* Auditability.

### Trade-Offs

* Additional learning curve.
* Ongoing module maintenance.

---

## ADR-004: Managed Identity Preferred

### Decision

Managed Identity will be used where supported.

### Reason

* Eliminates credential management.
* Reduces secret exposure.

### Trade-Offs

* Additional configuration complexity.

---

## ADR-005: Security Assessment Framework

### Decision

Each component will be assessed across:

* Identity
* Networking
* Monitoring
* Logging
* Data Protection
* Availability
* Disaster Recovery

### Reason

Provides a consistent architecture review methodology across all services.
