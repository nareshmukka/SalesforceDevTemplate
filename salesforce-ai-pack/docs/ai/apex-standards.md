# Apex Standards

## Core Design Rules

- Apex **MUST** be bulkified and transaction-safe.
- Business logic **MUST** live in services/domain classes, not triggers/controllers.
- Classes **SHOULD** have single, clear responsibilities.

## Trigger Standards

- One trigger per object.
- Trigger logic **MUST** delegate to a handler/service class.
- Trigger handlers **MUST** implement recursion guards and idempotency checks.
- Trigger code **MUST** handle insert/update/delete/undelete contexts explicitly.

## DML and Query Standards

- Never perform SOQL/DML inside unbounded loops.
- Query only needed fields.
- Use selectors/repositories for repeatable query patterns where helpful.

## User Mode/System Mode + Security

- Entry points **MUST** document execution context assumptions.
- CRUD/FLS checks **MUST** be enforced before sensitive reads/writes.
- System-mode operations **MUST** apply compensating authorization checks.

See [Security Model](./security-model.md).

## Integration in Apex

- Callout code **MUST** use Named Credentials / External Credentials.
- Endpoints and auth tokens **MUST NOT** be hardcoded.
- Retry/backoff and error mapping **SHOULD** be centralized.

See [Integration Standards](./integration-standards.md) and [Apex Examples](./examples/apex.md).

## Do / Don't

### Do

- Do use domain-specific exceptions and clear error contracts.
- Do keep methods short and intention-revealing.

### Don't

- Don't mix orchestration, SOQL, DML, and callouts in one large method.
- Don't bypass security checks in invocable or API-facing code.
