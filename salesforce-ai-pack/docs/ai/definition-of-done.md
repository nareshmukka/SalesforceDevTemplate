# Definition of Done (DoD)

A change is done only when **all** applicable checks below pass.

## Functional Completion

- Requirement acceptance criteria are met.
- Metadata compiles and validates in target org(s).
- Backward compatibility impact is documented.

## Security & Compliance

- CRUD/FLS enforcement is present and tested.
- User Mode vs System Mode decision is explicit.
- No hardcoded endpoints, tokens, or credentials.
- Integrations use Named Credentials / External Credentials.

See [Security Model](./security-model.md) and [Integration Standards](./integration-standards.md).

## Engineering Quality

- Bulk-safe logic for 200-record transactions.
- Recursion/idempotency controls for trigger+flow interactions.
- Fault handling for Flows and callouts is implemented.
- Logging/observability events are added for critical operations.

See [Flow Standards](./flow-standards.md) and [Observability & Logging](./observability-logging.md).

## Testing

- Apex tests follow AAA and cover success + negative + bulk + async scenarios.
- Callouts are mocked.
- `SeeAllData=true` is not used unless justified and approved.
- Minimum org deployment threshold is respected (**Salesforce platform minimum is 75%** overall Apex coverage).
- Team target may be higher and should be documented by release policy.

See [Testing Standards](./testing-standards.md) and [Examples](./examples/apex.md).

## Release Readiness

- Dependency order reviewed (objects → fields → record types → layouts → flows → code → permsets).
- Validation deployment executed before production deployment.
- Rollback plan included.
- Destructive changes are isolated and explicitly approved.

See [Deployment & Release](./deployment-release.md) and [Examples](./examples/deployments.md).

## Do / Don't

### Do

- Do block merge until all DoD items are complete.
- Do provide a concise risk register per deployment.

### Don't

- Don't mark done based only on local compile.
- Don't skip security/test evidence in PR descriptions.
