# Apex Examples

## Bulk-safe Trigger Handler Skeleton

```apex
trigger ClientProfileTrigger on Client_Profile__c (before insert, before update, after update) {
    FT_ClientProfileTriggerHandler.run(
        Trigger.operationType,
        Trigger.new,
        Trigger.oldMap
    );
}

public with sharing class FT_ClientProfileTriggerHandler {
    private static Boolean isRunning = false;

    public static void run(System.TriggerOperation op, List<Client_Profile__c> newList, Map<Id, Client_Profile__c> oldMap) {
        if (isRunning) return; // recursion guard
        isRunning = true;
        try {
            if (op == System.TriggerOperation.BEFORE_UPDATE) {
                FT_ClientProfileService.applyBusinessRules(newList, oldMap);
            }
        } finally {
            isRunning = false;
        }
    }
}
```

## CRUD/FLS Guard Pattern (conceptual)

```apex
public with sharing class FT_ClientProfileService {
  public static void updateGoal(Id clientId, String goal) {
    if (!Schema.sObjectType.Client_Profile__c.isUpdateable()) {
      throw new SecurityException('No object update access');
    }

    List<Client_Profile__c> rows = [
      SELECT Id, Goal__c
      FROM Client_Profile__c
      WHERE Id = :clientId
      LIMIT 1
    ];

    rows[0].Goal__c = goal;
    update rows;
  }
}
```

## Callout via Named Credential

```apex
public with sharing class FT_RemoteProgramClient {
  public static HttpResponse sendProgram(String payloadJson) {
    HttpRequest req = new HttpRequest();
    req.setMethod('POST');
    req.setEndpoint('callout:ProgramApi/v1/programs');
    req.setHeader('Content-Type', 'application/json');
    req.setBody(payloadJson);
    return new Http().send(req);
  }
}
```

Never hardcode full URLs or tokens. Use Named Credentials + External Credentials.
