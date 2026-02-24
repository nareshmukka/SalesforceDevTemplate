# Flow Examples

## Before-Save Flow Use Case

**Name**: `ClientProfile_BeforeSave_RecordTriggered`

- Trigger: before create/update on `Client_Profile__c`
- Purpose: set derived fields on same record only
- No DML on related objects
- No callouts

## After-Save Flow Use Case

**Name**: `TrainingSession_AfterSave_RecordTriggered`

- Trigger: after create/update on `Training_Session__c`
- Purpose: create follow-up tasks and publish notifications
- Uses invocable Apex for external sync enqueue
- Fault paths route to logging action/subflow

## Fault Path Pattern

- For each create/update/action element:
  - Connect fault path to a logging subflow
  - Capture: flow name, record id, element API name, fault message
  - Optionally notify support channel
