# Metadata Standards

## Scope

This file defines standards for Salesforce metadata lifecycle in SFDX repos.

## Objects & Fields

- Custom objects **MUST** include clear descriptions and ownership.
- Fields **MUST** define data type, help text, and security classification.
- Required fields **SHOULD** be required by business necessity, not convenience.
- High-cardinality lookup/filter fields **SHOULD** be evaluated for index strategy.

## Record Types & Layouts

- Record types **MUST** represent materially different business processes.
- Layout assignment **MUST** align with profiles/permsets strategy.
- Layout changes **SHOULD** avoid duplicating conditional logic that belongs in Dynamic Forms/Flow.

## Validation Rules

- Validation rules **MUST** include user-friendly, actionable messages.
- Bypass logic **MUST NOT** rely on hidden hardcoded profile names.
- Any bypass mechanism **MUST** be explicit (for example, controlled custom permission).

## Flows

- Flow metadata **MUST** include version notes and clear descriptions.
- Record-triggered flow design **MUST** follow [Flow Standards](./flow-standards.md).

## Permission Sets / PSGs

- Access grants **MUST** be permission-set centric, not profile-centric.
- PSGs **SHOULD** represent role bundles and remain minimal.
- Use muting permission sets where needed to reduce overgranting.

See [Examples](./examples/permsets.md).

## Custom Metadata

- Business configuration **SHOULD** be stored in Custom Metadata, not hardcoded in Apex.
- Custom Metadata records **MUST** have deterministic developer names.

## External IDs & Indexes

- Integration key fields **MUST** use External ID where appropriate.
- Query patterns for high-volume objects **MUST** be selective.
- If performance issues are expected, document index requests early.

## Do / Don't

### Do

- Do deploy metadata in dependency-safe order.
- Do keep metadata descriptions current for maintainability.

### Don't

- Don't hardcode business constants in code when metadata-driven config is viable.
- Don't create duplicate fields for the same business concept.
