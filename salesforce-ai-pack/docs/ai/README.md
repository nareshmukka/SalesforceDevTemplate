# AI-Assisted Salesforce Development Standards

This documentation pack defines reusable standards for AI-assisted Salesforce development in SFDX repositories.

## How to use these docs as context

When using Codex, Copilot, Claude, Agentforce, or similar assistants:

1. **Provide scope**: include object(s), flow(s), Apex class(es), and metadata in scope.
2. **Attach these docs**: include this folder (or link to key files) as working context.
3. **Require plan-first execution**: ask the agent to present a plan before implementation.
4. **Require standards references**: require file-level references to these rules in outputs.
5. **Gate on Definition of Done**: do not merge unless `definition-of-done.md` is satisfied.

## Prompt Recipe (Plan → Diff → Implement → Tests → Deploy)

Use this prompt recipe for consistent delivery quality:

```text
You are implementing Salesforce changes in an SFDX repo.
Follow docs/ai/* standards.

Process:
1) Plan: list impacted metadata and risks.
2) Diff: summarize exact files to change and why.
3) Implement: produce minimal, standards-compliant edits.
4) Tests: add/update Apex/LWC/Flow test strategy and run checks.
5) Deploy: provide validation + deployment commands and rollback notes.

Constraints:
- Enforce CRUD/FLS and user-mode/system-mode guidance.
- No hardcoded endpoints, secrets, IDs, or tokens.
- Use Named Credentials / External Credentials for callouts.
- Include recursion/idempotency protections for Trigger + Flow interplay.
```

## Standards Index

- [Agent Rules](./agent-rules.md)
- [Definition of Done](./definition-of-done.md)
- [Architecture](./architecture.md)
- [Naming Conventions](./naming-conventions.md)
- [Metadata Standards](./metadata-standards.md)
- [Security Model](./security-model.md)
- [Flow Standards](./flow-standards.md)
- [Deployment & Release](./deployment-release.md)
- [Testing Standards](./testing-standards.md)
- [LWC Standards](./lwc-standards.md)
- [Apex Standards](./apex-standards.md)
- [Integration Standards](./integration-standards.md)
- [Observability & Logging](./observability-logging.md)

## Examples (copy-paste ready)

- [Apex Examples](./examples/apex.md)
- [LWC Examples](./examples/lwc.md)
- [Flow Examples](./examples/flow.md)
- [Metadata Examples](./examples/metadata.md)
- [Permission Set / PSG Examples](./examples/permsets.md)
- [Deployment Examples](./examples/deployments.md)
