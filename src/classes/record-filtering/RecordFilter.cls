public with sharing class RecordFilter {
    private List<SObject> newRecords;
    private Map<Id, SObject> oldMap;
    private SObjectFilterCriteria criteria;

    public RecordFilter(List<SObject> newRecords, Map<Id, SObject> oldMap) {
        this.newRecords = newRecords;
        this.oldMap = oldMap;
    }

    public RecordFilter setCriteria(SObjectFilterCriteria criteria) {
        this.criteria = criteria;
        return this;
    }

    public List<SObject> filter() {
        List<SObject> filteredRecords = new List<SObject>();
        for (SObject newRecord : newRecords) {
            SObject oldRecord = oldMap.get(newRecord.Id);

            Boolean conditionsMet = criteria
                .setNewRecord(newRecord)
                .setOldRecord(oldRecord)
                .conditionsMet();

            if (conditionsMet) {
                filteredRecords.add(newRecord);
            }
        }
        return filteredRecords;
    }

    public List<SObject> getRecords() {
        return newRecords;
    }
}