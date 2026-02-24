# Integration Standards

## Authentication and Endpoint Management

- HTTP callouts **MUST** use Named Credentials with External Credentials where applicable.
- Endpoints, tokens, client secrets, and API keys **MUST NOT** be hardcoded.
- Integration settings **SHOULD** be metadata-driven (Custom Metadata) for non-secret config.

## Contract and Versioning

- API contracts **MUST** be documented (request/response, status handling, retries).
- Integrations **SHOULD** include explicit versioning strategy.
- Breaking contract changes **MUST** trigger consumer impact review.

## Reliability

- Callout flows **SHOULD** support idempotency keys when provider supports it.
- Retries **MUST** avoid duplicate side effects (idempotent design required).
- Failures **MUST** route to structured logging and alerting paths.

## Apex Implementation Guidance

- Use dedicated client classes per external system.
- Parse and validate external payloads defensively.
- Map provider errors into domain-level exceptions.

See [Apex Standards](./apex-standards.md) and [Observability & Logging](./observability-logging.md).

## Data Security

- PII-sensitive payload fields **MUST** be minimized and redacted in logs.
- Outbound data sets **MUST** obey least-data principles.

## Do / Don't

### Do

- Do isolate integration adapters from business logic.
- Do include timeout, retry, and fallback strategy.

### Don't

- Don't embed bearer tokens in Apex strings.
- Don't assume third-party availability in synchronous user-critical flows.
