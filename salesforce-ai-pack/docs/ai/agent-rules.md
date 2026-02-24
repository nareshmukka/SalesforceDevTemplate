# Agent Rules

## Purpose

These rules govern AI agents modifying this Salesforce SFDX repository.

## Core Rules

- Agents **MUST** produce a short implementation plan before editing files.
- Agents **MUST** list exact files to be changed before writing code.
- Agents **MUST** prefer small, focused diffs over broad refactors.
- Agents **MUST NOT** modify unrelated metadata.
- Agents **MUST** follow all standards in this folder and cite them in summary.
- Agents **MUST** preserve existing package/module boundaries.
- Agents **MUST NOT** add secrets, access tokens, org credentials, or hardcoded IDs.

## Salesforce-Specific Rules

- Agents **MUST** enforce CRUD/FLS in Apex entry points and data access paths.
- Agents **MUST** account for **User Mode vs System Mode** behavior in Apex, Flow, and integrations.
- Agents **MUST** design for bulk operations (up to 200 records per transaction).
- Agents **MUST** include trigger/flow recursion and idempotency protections.
- Agents **MUST** use Named Credentials / External Credentials for HTTP callouts.
- Agents **MUST NOT** hardcode endpoints or tokens.

See [Security Model](./security-model.md), [Flow Standards](./flow-standards.md), and [Integration Standards](./integration-standards.md).

## Do / Don't

### Do

- Do map each requirement to impacted metadata.
- Do state assumptions and org constraints explicitly.
- Do propose rollback-safe deployment steps.

### Don't

- Don't deploy destructive changes without an approved plan.
- Don't introduce `SeeAllData=true` tests by default.
- Don't bypass field/object security controls.

## Output Contract for Agents

Every implementation response **MUST** include:

1. Plan
2. File diff summary
3. Security notes
4. Test updates + commands
5. Deployment validation commands

Use [Definition of Done](./definition-of-done.md) as the final gate.
