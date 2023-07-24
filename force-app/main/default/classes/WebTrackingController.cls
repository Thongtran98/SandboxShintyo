public without sharing class WebTrackingController {
    
    @AuraEnabled(cacheable = true)
    public static clofor_com_cfs__CustomObject1__c getShipments(String id){
        List<clofor_com_cfs__CustomObject1__c> results = [SELECT Id, 
        clofor_com_cfs__POL__r.Name, clofor_com_cfs__POD__r.Name, 
        clofor_com_cfs__Vessle__c, 
        clofor_com_cfs__Voy_No__c, 
        clofor_com_cfs__ETD__c, 
        clofor_com_cfs__ETA__c,
        Vessel_Status__c, 
        RecordType.Name,
        clofor_com_cfs__status__c 
                FROM clofor_com_cfs__CustomObject1__c
                WHERE Id = :id];
        if(results.size() > 0){
            return results.get(0);
        } else {
            return null;
        }
        
    }
    @AuraEnabled(cacheable = true)
    public static List<clofor_com_cfs__Transit__c> getTransitsByShipment(String shipmentId){
        return [SELECT Id, clofor_com_cfs__TransitPort__r.Name, 
        clofor_com_cfs__ETDAtTransitPort__c,
        clofor_com_cfs__ETAAtTransitPort__c,
        clofor_com_cfs__InOrderOfTransit__c, 
        clofor_com_cfs__ShipmentOrder__r.Id  
                FROM clofor_com_cfs__Transit__c
                WHERE clofor_com_cfs__ShipmentOrder__r.Id = :shipmentId
                ORDER BY clofor_com_cfs__InOrderOfTransit__c ASC];
    }
    @AuraEnabled(cacheable = true)
    public static List<Boolean> getPositions(String shipmentId){
        List<clofor_com_cfs__Transit__c> transit = getTransitsByShipment(shipmentId);
        
        clofor_com_cfs__CustomObject1__c shipment = getShipments(shipmentId);
        List<Boolean> results = new List<Boolean>();

        Date prevTimeLine = Date.valueOf(shipment.clofor_com_cfs__ETD__c);
        Date lastTimeLine = Date.valueOf(shipment.clofor_com_cfs__ETA__c);
        Date today = system.today();

        if(today <= prevTimeLine){
            results.add(true);
        } else {
            results.add(false);
        }
        if(transit.size() > 0){
            for(Integer i = 0; i<transit.size(); i++){
                 if(today >= Date.valueOf(transit.get(i).clofor_com_cfs__ETAAtTransitPort__c) && today <= Date.valueOf(transit.get(i).clofor_com_cfs__ETDAtTransitPort__c) && ((i+1 <= transit.size()-1 && Date.valueOf(transit.get(i).clofor_com_cfs__ETDAtTransitPort__c) < Date.valueOf(transit.get(i+1).clofor_com_cfs__ETAAtTransitPort__c)) || (i+1 > transit.size()-1))){
                    results.add(false);
                    results.add(true);
                } else if((today > prevTimeLine && (transit.get(i).clofor_com_cfs__ETAAtTransitPort__c == null || today < Date.valueOf(transit.get(i).clofor_com_cfs__ETAAtTransitPort__c))) && today < lastTimeLine){
                    results.add(true);
                    results.add(false);
                } else {
                    results.add(false);
                    results.add(false);
                }
                prevTimeLine = Date.valueOf(transit.get(i).clofor_com_cfs__ETDAtTransitPort__c);
            }
            if(today >= lastTimeLine){
                results.add(false);
                results.add(true);
            } else if((today > prevTimeLine && (shipment.clofor_com_cfs__ETA__c == null || today < lastTimeLine)) && today < lastTimeLine){
                results.add(true);
                results.add(false);
            } else {
                results.add(false);
                results.add(false);
            }
        } else {
            if(today >= lastTimeLine){
                results.add(false);
                results.add(true);
            } else if((today > prevTimeLine && (shipment.clofor_com_cfs__ETA__c == null || today < lastTimeLine)) && today < lastTimeLine){
                results.add(true);
                results.add(false);
            } else {
                results.add(false);
                results.add(false);
            }
        }
        return results;
    }
}