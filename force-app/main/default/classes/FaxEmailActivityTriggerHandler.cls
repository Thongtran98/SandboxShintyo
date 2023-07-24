public class FaxEmailActivityTriggerHandler {

    public FaxEmailActivityTriggerHandler() {
        
    }
    
    public void createContentDocumentLink(List<FaxEmailActivity__c> listFaxEmailActivity) {
        try {
            List<ContentDocumentLink> listCDL = new List<ContentDocumentLink>();
            Set<String> setContentVersionId = new Set<String>();
            for (FaxEmailActivity__c f : listFaxEmailActivity) {
                if (f.AttachedFiles__c != null) {
                    List<String> listAttachedIds = f.AttachedFiles__c.split(',');
                    for (String cvId : listAttachedIds) {
                        if(cvId != null) {
                            setContentVersionId.add(cvId);
                            ContentDocumentLink cdl = new ContentDocumentLink(
                                ContentDocumentId = cvId,
                                LinkedEntityId = f.Id,
                                ShareType = 'V'
                            );
                            listCDL.add(cdl);
                        }
                    }
                }
            }

            if (!listCDL.isEmpty()) {
                Map<Id,ContentVersion> mapCv = getContentVersion(setContentVersionId);
                List<ContentDocumentLink> listCdlInsert = new List<ContentDocumentLink>();
                for (ContentDocumentLink cdl : listCDL) {
					String cvKey = cdl.ContentDocumentId;
                    if (mapCv.containsKey(cvKey)) {
                        cdl.ContentDocumentId = mapCv.get(cvKey).ContentDocumentId;
                        listCdlInsert.add(cdl);
                    }
                }

                // Insert Data ContentDocumentLink to record when send email attchedfiles   
                if (!listCdlInsert.isEmpty()) {
                    insert listCdlInsert;
                }
            }            
        } catch (Exception ex) {
            throw new CustomException(ex.getMessage());
        }
    }
    
    private static Map<Id,ContentVersion> getContentVersion(Set<String> setId) {
        return new Map<Id,ContentVersion>([SELECT Id
                                           		,ContentDocumentId
                                           FROM ContentVersion
                                           WHERE Id IN :setId
                                        ]);
    }
    
    public class CustomException extends Exception {}
}