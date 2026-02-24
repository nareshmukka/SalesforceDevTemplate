# LWC Standards

## Component Architecture

- Components **SHOULD** follow smart/dumb separation:
  - Smart/container components handle data orchestration.
  - Dumb/presentational components render state and emit events.
- Reusable UI components **MUST** keep business logic minimal.

## Data Access Patterns

- Prefer LDS/UI API for standard CRUD where feasible.
- Use `@wire` for reactive reads and cache-friendly retrieval.
- Use imperative Apex only for explicit user actions or non-reactive logic.

## Error Handling

- Components **MUST** handle loading, empty, success, and error states.
- Errors **SHOULD** be normalized and displayed with actionable messaging.
- Sensitive exception details **MUST NOT** be exposed to end users.

## Performance

- Minimize re-renders and expensive computed work.
- Batch UI updates where possible.
- Avoid unnecessary Apex round trips when LDS/UI API can satisfy requirements.

## Security

- UI checks **MUST NOT** replace server-side authorization.
- Apex controllers called by LWC **MUST** enforce CRUD/FLS per [Security Model](./security-model.md).

## Testing Strategy

- Jest tests **SHOULD** cover rendering states, event contracts, and error behavior.
- Use mocks for Apex methods and wire adapters.

See [LWC Examples](./examples/lwc.md).

## Do / Don't

### Do

- Do keep components small and composable.
- Do document public `@api` inputs/outputs.

### Don't

- Don't place complex business rules in UI-only JavaScript.
- Don't use imperative data loading when reactive wire suffices.
