# Deployment & Release Standards

## Dependency Ordering

Deploy metadata in this order unless a justified exception exists:

1. Objects
2. Fields
3. Record Types
4. Layouts / FlexiPages
5. Flows / Validation Rules / Automation metadata
6. Apex / LWC / Aura
7. Permission Sets / Permission Set Groups

## Package Manifest Strategy

- `package.xml` **SHOULD** be used for deterministic, reviewable deploy scopes.
- Manifest files **MUST** include only required components for each release unit.
- Large releases **SHOULD** be split into coherent deployment waves.

## Validation Commands

Use validation-first release flow in CI/CD and pre-prod checks:

```bash
sf project deploy start --manifest manifest/package.xml --target-org <alias> --check-only --test-level RunLocalTests --wait 60
sf project deploy report --use-most-recent --target-org <alias>
```

For production quick deploy after successful validation:

```bash
sf project deploy quick --job-id <validatedJobId> --target-org <prodAlias>
```

See [Deployment Examples](./examples/deployments.md).

## Destructive Changes Policy

- Destructive changes **MUST** be explicitly approved.
- Destructive manifests **MUST** be isolated, reviewed, and reversible.
- Rollback/restore strategy **MUST** be documented before execution.

## Release Quality Gates

- Security review items resolved.
- Tests pass with required coverage.
- Integration dependencies confirmed.
- Post-deploy smoke tests defined and executed.

## Do / Don't

### Do

- Do validate in a production-like org before production.
- Do include dependency and sequencing notes in release tickets.

### Don't

- Don't mix risky destructive changes with broad feature deploys.
- Don't deploy metadata subsets that break references.
