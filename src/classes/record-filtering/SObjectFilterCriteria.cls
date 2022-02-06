public abstract class SObjectFilterCriteria {
    protected SObject newRecord;
    protected SObject oldRecord;

    public SObjectFilterCriteria setNewRecord(SObject newRecord) {
        this.newRecord = newRecord;
        return this;
    }

    public SObjectFilterCriteria setOldRecord(SObject oldRecord) {
        this.oldRecord = oldRecord;
        return this;
    }

    public abstract Boolean conditionsMet();
}