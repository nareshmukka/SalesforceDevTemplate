# Architecture Standards

## Architectural Principles

- Design **MUST** separate domain logic from transport concerns (UI/API/Flow triggers).
- Business rules **SHOULD** be centralized in Apex service/domain layers.
- Integrations **MUST** isolate provider-specific logic behind interfaces.
- Metadata design **MUST** prefer declarative where maintainable and observable.

## Recommended Layering

1. **Entry Layer**: Trigger handlers, invocable actions, REST controllers, LWCs.
2. **Application Layer**: Orchestration services and transaction boundaries.
3. **Domain Layer**: Core business rules, validation, idempotency.
4. **Infrastructure Layer**: DML wrappers, selectors, HTTP clients, platform events.

## Trigger + Flow Interaction Model

- Use one trigger per object with handler delegation.
- Triggers and record-triggered flows **MUST** be idempotent.
- Recursion guards **MUST** prevent repeated updates in same transaction.
- When Flow updates can retrigger automation, guard with change-detection checks.

See [Flow Standards](./flow-standards.md) and [Apex Standards](./apex-standards.md).

## User Mode vs System Mode

- Entry points handling end-user initiated actions **SHOULD** prefer user-context operations when feasible.
- Privileged operations in system mode **MUST** be narrow, documented, and audited.
- Any escalation path **MUST** enforce least privilege and explicit authorization checks.

## Data Design Considerations

- Use external IDs for matching/upsert and integration idempotency keys.
- Use selective filters and indexes for large-data-volume queries.
- Keep object ownership and sharing model aligned to access needs.

## Do / Don't

### Do

- Do document sequence diagrams for critical automations.
- Do define failure-handling behavior for every integration path.

### Don't

- Don't place business logic directly in triggers or LWCs.
- Don't split same business rule across Flow and Apex without clear ownership.
