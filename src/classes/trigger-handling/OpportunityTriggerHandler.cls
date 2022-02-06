public with sharing class OpportunityTriggerHandler extends TriggerHandler {
    public override void beforeUpdate() {
        new OppCommissionAssignmentService(Trigger.new, (Map<Id, Opportunity>) Trigger.oldMap)
            .assignCommissions();
    }
}