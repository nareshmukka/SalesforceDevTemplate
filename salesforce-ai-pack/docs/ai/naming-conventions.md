# Naming Conventions

## Global Standards

- Names **MUST** be descriptive, stable, and domain-oriented.
- Names **MUST** use a project prefix for custom artifacts (for example, `FT_` for Apex class names).
- Abbreviations **SHOULD** be minimized unless industry-standard.

## Apex

- Classes: `FT_<Domain><Role>` (e.g., `FT_AssignmentService`).
- Interfaces: `IFT_<Capability>`.
- Tests: `<ClassName>Test`.
- Methods: verbs for actions, nouns for getters/selectors.

## LWC

- Folder names: lower camel case (e.g., `ftClientDashboard`).
- JS classes: PascalCase.
- Public API properties: meaningful `@api` names.

## Metadata

- Custom Objects/Fields: use clear labels and stable API names.
- Flows: `<Domain>_<Event>_<Type>` (e.g., `TrainingSession_AfterSave_RecordTriggered`).
- Validation Rules: `VR_<Object>_<RuleIntent>`.
- Permission Sets: `PS_<DomainOrRole>`.
- Permission Set Groups: `PSG_<DomainOrRole>`.
- Custom Metadata Types/Records: `CMDT_<Domain>` and semantic developer names.

See [Metadata Standards](./metadata-standards.md) and [Examples](./examples/metadata.md).

## Do / Don't

### Do

- Do align class, test, and metadata names to the same business vocabulary.
- Do include automation type in flow names.

### Don't

- Don't use temporary names like `TestFlow2` or `NewField1`.
- Don't rename API names without migration and dependency review.
