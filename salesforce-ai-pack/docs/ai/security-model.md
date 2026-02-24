# Security Model Standards

## Core Security Requirements

- All data access logic **MUST** consider CRUD, FLS, sharing, and execution mode.
- Security checks **MUST** be explicit at service boundaries.
- Privileged operations **MUST** be narrowly scoped and auditable.

## User Mode vs System Mode Guidance

- User mode execution **SHOULD** be used for user-driven operations where feasible.
- System mode execution **MAY** be used for controlled platform automation needs.
- When using system mode, code **MUST** apply compensating controls:
  - Object/field accessibility checks.
  - Record-level access checks when required by policy.
  - Business authorization checks (for example, role/custom permission).

## CRUD/FLS Enforcement Patterns

- Entry-layer Apex (controllers, invocables, REST) **MUST** enforce object and field access.
- Queries **SHOULD** use patterns that prevent returning unauthorized fields.
- DML payloads **MUST** remove inaccessible fields before save when needed.

Reference implementation patterns: [Apex Examples](./examples/apex.md).

## Flow Security

- Flow designers **MUST** document context and access expectations.
- Screen flows **SHOULD** avoid exposing fields users cannot edit by policy.
- Invocable Apex called by Flow **MUST** enforce its own security assumptions.

See [Flow Standards](./flow-standards.md).

## Secret and Credential Handling

- Secrets **MUST** never be stored in code, custom settings, or custom metadata plain text.
- Callout auth **MUST** use Named Credentials + External Credentials.
- Tokens/endpoints **MUST NOT** be hardcoded.

See [Integration Standards](./integration-standards.md).

## Do / Don't

### Do

- Do use least-privilege permission sets.
- Do include security review notes in PRs for sensitive changes.

### Don't

- Don't assume system mode implies business authorization.
- Don't use profile-name checks as authorization controls.
