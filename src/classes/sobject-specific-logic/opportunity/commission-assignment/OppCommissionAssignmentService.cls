public with sharing class OppCommissionAssignmentService {
    List<Opportunity> newRecords;
    Map<Id, Opportunity> oldMap;

    public OppCommissionAssignmentService(List<Opportunity> newRecords, Map<Id, Opportunity> oldMap) {
        this.newRecords = newRecords;
        this.oldMap = oldMap;
    }

    public void assignCommissions() {
        List<Opportunity> filteredOpportunities =
            new RecordFilter(newRecords, oldMap)
                .setCriteria(new OppCommissionFilterCriteria())
                .filter();

        if (!filteredOpportunities.isEmpty()) {
            for (Opportunity opp : filteredOpportunities) {
                opp.OwnerCommission__c = 2000;
            }
        }
    }
}