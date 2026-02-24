# Metadata Examples

## Validation Rule Naming

- `VR_ClientProfile_GoalDateRequired`
- `VR_TrainingSession_EndAfterStart`

## Flow Naming

- `ClientProfile_BeforeSave_RecordTriggered`
- `TrainerAssignment_AfterSave_RecordTriggered`
- `ProgramSync_Autolaunched_Subflow`

## Custom Metadata Pattern

- Type: `CMDT_Integration_Config__mdt`
- Records:
  - `ProgramApi_Default`
  - `ProgramApi_Sandbox`

Use custom metadata for non-secret settings (timeouts, feature toggles, endpoint suffixes).
