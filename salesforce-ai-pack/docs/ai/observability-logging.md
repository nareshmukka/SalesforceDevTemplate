# Observability & Logging Standards

## Logging Principles

- Logs **MUST** support diagnosis without exposing secrets or sensitive data.
- Critical business events **MUST** include correlation identifiers.
- Error logs **MUST** include actionable context: operation, entity key, and failure class.

## Event Taxonomy

- **Audit events**: security-relevant state changes.
- **Business events**: domain milestones and SLA markers.
- **Technical events**: retries, queue failures, integration exceptions.

## Implementation Patterns

- Use centralized logging helpers in Apex.
- For asynchronous paths, include job IDs and parent transaction identifiers.
- For Flow fault paths, capture fault source and input context summary.

## Alerting and Operations

- Repeated integration failures **MUST** trigger alerts.
- High-severity automation faults **SHOULD** notify support channels.
- Dashboards **SHOULD** track flow fault rate, async backlog, and integration latency.

## Do / Don't

### Do

- Do redact PII and credentials in all logs.
- Do standardize log formats for searchability.

### Don't

- Don't swallow exceptions silently.
- Don't log raw secrets, tokens, or authorization headers.
