# Flow Standards

## Flow Design Rubric

### Before-Save vs After-Save

- **Before-save record-triggered flow** **MUST** be used for in-record field updates when no related records/callouts are required.
- **After-save record-triggered flow** **MUST** be used for related records, async actions, platform events, or callouts via invocable Apex.
- Avoid using after-save for simple same-record updates due to performance overhead.

### Subflows

- Shared business logic **SHOULD** be moved into autolaunched subflows.
- Subflows **MUST** have clear input/output contracts and descriptions.

### Fault Paths (Required)

- Every DML/action element **MUST** have a fault path.
- Fault paths **MUST** log enough context for support triage.
- User-facing flows **SHOULD** show actionable error messaging.

## Trigger + Flow Coexistence

- Trigger and Flow logic on same object **MUST** include idempotency checks.
- Changes emitted by one automation **MUST NOT** endlessly retrigger the other.
- Use decision nodes and “changed fields” filters to prevent no-op reprocessing.

## Limits and Performance

- Flows **MUST** be designed for bulk operations (up to 200 records).
- Avoid per-record SOQL/DML patterns in loops.
- Use collection operations and scheduled/asynchronous patterns where needed.

## Invocable Apex Guidance

- Invocable Apex **MUST** be bulkified and fault-tolerant.
- Invocables **MUST** enforce CRUD/FLS and mode assumptions.
- Invocables for callouts **MUST** use Named Credentials/External Credentials.

See [Apex Standards](./apex-standards.md) and [Integration Standards](./integration-standards.md).

## Do / Don't

### Do

- Do prefer declarative logic for straightforward orchestration.
- Do document flow entry criteria and exit outcomes.

### Don't

- Don't chain many flows without clear ownership and observability.
- Don't use Flow for complex operations better suited for Apex services.

See [Flow Examples](./examples/flow.md).
