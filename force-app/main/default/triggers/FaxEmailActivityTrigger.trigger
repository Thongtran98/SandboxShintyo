trigger FaxEmailActivityTrigger on FaxEmailActivity__c (after insert) {
    FaxEmailActivityTriggerHandler hndl = new FaxEmailActivityTriggerHandler();
	if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            hndl.createContentDocumentLink(Trigger.new);
        }
    }
}