trigger OpportunityTrigger on Opportunity (before update) {
    new OpportunityTriggerHandler().run();
}