public with sharing class OppCommissionFilterCriteria extends SObjectFilterCriteria {
    public override Boolean conditionsMet() {
        return ((Opportunity) newRecord).StageName == 'Closed Won'
            && ((Opportunity) newRecord).StageName != ((Opportunity) oldRecord).StageName;
    }
}