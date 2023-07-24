public without sharing class WebTrackingFormController {
    @AuraEnabled(cacheable = true)
    public static String getIdShipment(String search, String type){
        if (type == 'boln'){
            System.debug('1234:');
            return [SELECT Id
                FROM clofor_com_cfs__CustomObject1__c
                WHERE clofor_com_cfs__HBL__c = :search OR clofor_com_cfs__HAWB__c = :search
                LIMIT 1].Id;
        }
        if (type == 'bn'){
            return [SELECT Id
                FROM clofor_com_cfs__CustomObject1__c
                WHERE clofor_com_cfs__MASTER_BOOKINGNO__c = :search
                LIMIT 1].Id;
        }
        if (type == 'cn'){
            return [SELECT Id,clofor_com_cfs__HBL_SHIPMENT__c
                FROM clofor_com_cfs__Container_Info__c
                WHERE clofor_com_cfs__Container_NO__c = :search
                LIMIT 1].clofor_com_cfs__HBL_SHIPMENT__c;
        }
        return '';
    }

    @AuraEnabled(cacheable = true)
    public static List<clofor_com_cfs__CustomObject1__c> getListShipment(String search, String type){
        if (type == 'boln'){
            return [SELECT Id, Name, clofor_com_cfs__HBL__c, clofor_com_cfs__HAWB__c, clofor_com_cfs__Master_B_L__c, clofor_com_cfs__MAWB__c, clofor_com_cfs__HouseBookingNo__c, clofor_com_cfs__MASTER_BOOKINGNO__c
                FROM clofor_com_cfs__CustomObject1__c
                WHERE clofor_com_cfs__HBL__c = :search OR clofor_com_cfs__HAWB__c = :search];
        }
        if (type == 'bn'){
            return [SELECT Id, Name, clofor_com_cfs__HBL__c, clofor_com_cfs__HAWB__c, clofor_com_cfs__Master_B_L__c, clofor_com_cfs__MAWB__c, clofor_com_cfs__HouseBookingNo__c, clofor_com_cfs__MASTER_BOOKINGNO__c
                FROM clofor_com_cfs__CustomObject1__c
                WHERE clofor_com_cfs__MASTER_BOOKINGNO__c = :search];
        }
        if (type == 'cn'){
            List<String> lstId = new List<String>(); 
            List<clofor_com_cfs__Container_Info__c> lstCont= [SELECT Id, Name, clofor_com_cfs__HBL_SHIPMENT__c
                FROM clofor_com_cfs__Container_Info__c
                WHERE clofor_com_cfs__Container_NO__c = :search];
            for (clofor_com_cfs__Container_Info__c cont : lstCont){
                lstId.add(cont.clofor_com_cfs__HBL_SHIPMENT__c);
            }
            return [SELECT Id, Name, clofor_com_cfs__HBL__c, clofor_com_cfs__HAWB__c, clofor_com_cfs__Master_B_L__c, clofor_com_cfs__MAWB__c, clofor_com_cfs__HouseBookingNo__c, clofor_com_cfs__MASTER_BOOKINGNO__c
                FROM clofor_com_cfs__CustomObject1__c
                WHERE Id IN :lstId];
        }
        return [SELECT Id, Name, clofor_com_cfs__HBL__c, clofor_com_cfs__HAWB__c, clofor_com_cfs__Master_B_L__c, clofor_com_cfs__MAWB__c, clofor_com_cfs__HouseBookingNo__c, clofor_com_cfs__MASTER_BOOKINGNO__c
        FROM clofor_com_cfs__CustomObject1__c];
    }
}