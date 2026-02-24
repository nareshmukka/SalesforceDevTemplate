# Testing Standards

## Apex Testing Principles

- Tests **MUST** use AAA (Arrange, Act, Assert).
- Tests **MUST** be deterministic and isolated.
- `SeeAllData=true` **MUST NOT** be used by default.
- Shared test data **SHOULD** come from a test data factory.

## Required Test Scenarios

- Happy path behavior.
- Negative/error path behavior.
- Bulk behavior with up to 200 records.
- Async behavior (`Queueable`, `Future`, `Batch`, scheduled).
- Security-sensitive behavior where relevant.

## Callout Testing

- HTTP callouts **MUST** use `HttpCalloutMock` (or equivalent mock pattern).
- Tests **MUST NOT** depend on real endpoints.
- Named Credential usage **SHOULD** be abstracted to allow mock isolation.

## Coverage Policy

- Salesforce platform requirement is **75% overall Apex coverage**.
- Team-level target **MAY** be higher by policy.
- Coverage without assertions is insufficient and should be rejected.

## LWC Testing Strategy

- LWC Jest tests **SHOULD** validate rendering, events, and error states.
- Prefer testing component behavior over private implementation details.

See [LWC Examples](./examples/lwc.md).

## Flow Testing Strategy

- Validate entry criteria, branch paths, and fault handling.
- Validate flow-triggered side effects and idempotency.
- Use Apex tests where necessary to verify flow-invoked Apex.

See [Flow Examples](./examples/flow.md).

## Do / Don't

### Do

- Do assert business outcomes, not just code paths.
- Do include regression tests for fixed defects.

### Don't

- Don't write brittle tests coupled to non-contract internals.
- Don't skip bulk and async test cases on automation-heavy objects.
