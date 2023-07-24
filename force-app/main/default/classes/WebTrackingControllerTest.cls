@isTest
public with sharing class WebTrackingControllerTest {
    public static testMethod void checkWebTrackingController() {
        clofor_com_cfs__Port__c testPort1 = new clofor_com_cfs__Port__c();
        testPort1.Name = 'testPort1';

        // clofor_com_cfs__Port__c testPort2 = new clofor_com_cfs__Port__c();
        // testPort2.Name = 'testPort2';

        // List<clofor_com_cfs__Port__c> testPorts = new List<clofor_com_cfs__Port__c>();
        // testPorts.add(testPort1);
        // testPorts.add(testPort2);
        // insert testPorts;

        Account ac = new Account(
            clofor_com_cfs__CompanyShortName__c = 'ABC',                               // Business Relationship
            Name = 'Customer service',                                                              // Tax Code
            clofor_com_cfs__CustomerType__c = 'Enterprise'                                       // Mail
        );
        insert ac;

        List<clofor_com_cfs__CustomObject1__c> testShipments = new List<clofor_com_cfs__CustomObject1__c>();
        clofor_com_cfs__CustomObject1__c testShipment = new clofor_com_cfs__CustomObject1__c();
        testShipment.clofor_com_cfs__POL__c = testPort1.Id;
        // testShipment.clofor_com_cfs__POD__c = testPort2.Id;
        testShipment.RecordTypeId = Schema.SObjectType.clofor_com_cfs__CustomObject1__c.getRecordTypeInfosByName().get('Ocean Export').getRecordTypeId();
        testShipment.clofor_com_cfs__Field1__c = ac.Id;
        testShipment.clofor_com_cfs__Vessle__c = 'dsadsadsa';
        testShipment.clofor_com_cfs__Voy_No__c = 'dsdsdsdsdss';
        testShipment.clofor_com_cfs__ETD__c = system.today();
        testShipment.clofor_com_cfs__ETA__c = system.today();
        testShipments.add(testShipment);

        clofor_com_cfs__CustomObject1__c testShipment2 = new clofor_com_cfs__CustomObject1__c();
        testShipment2.clofor_com_cfs__POL__c = testPort1.Id;
        // testShipment2.clofor_com_cfs__POD__c = testPort2.Id;
        testShipment2.RecordTypeId = Schema.SObjectType.clofor_com_cfs__CustomObject1__c.getRecordTypeInfosByName().get('Ocean Export').getRecordTypeId();
        testShipment2.clofor_com_cfs__Field1__c = ac.Id;
        testShipment2.clofor_com_cfs__Vessle__c = 'dsadsadsa';
        testShipment2.clofor_com_cfs__Voy_No__c = 'dsdsdsdsdss';
        testShipment2.clofor_com_cfs__ETD__c = Date.newInstance(2023, 1, 20);
        testShipment2.clofor_com_cfs__ETA__c = Date.newInstance(2023, 2, 5);
        testShipments.add(testShipment2);

        clofor_com_cfs__CustomObject1__c testShipment3 = new clofor_com_cfs__CustomObject1__c();
        testShipment3.clofor_com_cfs__POL__c = testPort1.Id;
        // testShipment3.clofor_com_cfs__POD__c = testPort2.Id;
        testShipment3.RecordTypeId = Schema.SObjectType.clofor_com_cfs__CustomObject1__c.getRecordTypeInfosByName().get('Ocean Export').getRecordTypeId();
        testShipment3.clofor_com_cfs__Field1__c = ac.Id;
        testShipment3.clofor_com_cfs__Vessle__c = 'dsadsadsa';
        testShipment3.clofor_com_cfs__Voy_No__c = 'dsdsdsdsdss';
        testShipment3.clofor_com_cfs__ETD__c = Date.newInstance(2023, 2, 5);
        testShipment3.clofor_com_cfs__ETA__c = Date.newInstance(2023, 2, 6);
        testShipments.add(testShipment3);

        clofor_com_cfs__CustomObject1__c testShipment4 = new clofor_com_cfs__CustomObject1__c();
        testShipment4.clofor_com_cfs__POL__c = testPort1.Id;
        // testShipment4.clofor_com_cfs__POD__c = testPort2.Id;
        testShipment4.RecordTypeId = Schema.SObjectType.clofor_com_cfs__CustomObject1__c.getRecordTypeInfosByName().get('Ocean Export').getRecordTypeId();
        testShipment4.clofor_com_cfs__Field1__c = ac.Id;
        testShipment4.clofor_com_cfs__Vessle__c = 'dsadsadsa';
        testShipment4.clofor_com_cfs__Voy_No__c = 'dsdsdsdsdss';
        testShipment4.clofor_com_cfs__ETD__c = Date.newInstance(2023, 1, 20);
        testShipment4.clofor_com_cfs__ETA__c = Date.newInstance(2023, 2, 5);
        testShipments.add(testShipment4);

        clofor_com_cfs__CustomObject1__c testShipment5 = new clofor_com_cfs__CustomObject1__c();
        testShipment5.clofor_com_cfs__POL__c = testPort1.Id;
        // testShipment5.clofor_com_cfs__POD__c = testPort2.Id;
        testShipment5.RecordTypeId = Schema.SObjectType.clofor_com_cfs__CustomObject1__c.getRecordTypeInfosByName().get('Ocean Export').getRecordTypeId();
        testShipment5.clofor_com_cfs__Field1__c = ac.Id;
        testShipment5.clofor_com_cfs__Vessle__c = 'dsadsadsa';
        testShipment5.clofor_com_cfs__Voy_No__c = 'dsdsdsdsdss';
        testShipment5.clofor_com_cfs__ETD__c = Date.newInstance(2023, 1, 20);
        testShipment5.clofor_com_cfs__ETA__c = Date.newInstance(2023, 2, 5);
        testShipments.add(testShipment5);

        clofor_com_cfs__CustomObject1__c testShipment6 = new clofor_com_cfs__CustomObject1__c();
        testShipment6.clofor_com_cfs__POL__c = testPort1.Id;
        // testShipment6.clofor_com_cfs__POD__c = testPort2.Id;
        testShipment6.RecordTypeId = Schema.SObjectType.clofor_com_cfs__CustomObject1__c.getRecordTypeInfosByName().get('Ocean Export').getRecordTypeId();
        testShipment6.clofor_com_cfs__Field1__c = ac.Id;
        testShipment6.clofor_com_cfs__Vessle__c = 'dsadsadsa';
        testShipment6.clofor_com_cfs__Voy_No__c = 'dsdsdsdsdss';
        testShipment6.clofor_com_cfs__ETD__c = Date.newInstance(2023, 1, 20);
        testShipment6.clofor_com_cfs__ETA__c = Date.newInstance(2023, 2, 5);
        testShipments.add(testShipment6);

        insert testShipments;

        List<clofor_com_cfs__Transit__c> testTransits = new List<clofor_com_cfs__Transit__c>();
        clofor_com_cfs__Transit__c testTransit = new clofor_com_cfs__Transit__c();
        testTransit.clofor_com_cfs__ShipmentOrder__c = testShipment.Id;
        testTransit.clofor_com_cfs__InOrderOfTransit__c = 1;
        testTransits.add(testTransit);

        clofor_com_cfs__Transit__c testTransit2 = new clofor_com_cfs__Transit__c();
        testTransit2.clofor_com_cfs__ShipmentOrder__c = testShipment4.Id;
        testTransit2.clofor_com_cfs__InOrderOfTransit__c = 1;
        testTransits.add(testTransit2);

        clofor_com_cfs__Transit__c testTransit3 = new clofor_com_cfs__Transit__c();
        testTransit3.clofor_com_cfs__ShipmentOrder__c = testShipment5.Id;
        testTransit3.clofor_com_cfs__InOrderOfTransit__c = 1;
        testTransit3.clofor_com_cfs__ETAAtTransitPort__c =  Date.newInstance(2023, 2, 3);
        testTransits.add(testTransit3);

        clofor_com_cfs__Transit__c testTransit4 = new clofor_com_cfs__Transit__c();
        testTransit4.clofor_com_cfs__ShipmentOrder__c = testShipment6.Id;
        testTransit4.clofor_com_cfs__InOrderOfTransit__c = 1;
        testTransit4.clofor_com_cfs__ETAAtTransitPort__c =  Date.newInstance(2023, 1, 28);
        testTransit4.clofor_com_cfs__ETDAtTransitPort__c =  Date.newInstance(2023, 2, 1);
        testTransits.add(testTransit4);

        insert testTransits;

        test.startTest();
        clofor_com_cfs__CustomObject1__c testShipmentsQ = WebTrackingController.getShipments(testShipment.Id);
        clofor_com_cfs__CustomObject1__c testShipmentsQ1 = WebTrackingController.getShipments('dsadsa');
        List<clofor_com_cfs__Transit__c> testTransitsQ = WebTrackingController.getTransitsByShipment(testShipment.Id);
        List<Boolean> testPosition1 = WebTrackingController.getPositions(testShipment2.Id);
        List<Boolean> testPosition = WebTrackingController.getPositions(testShipment.Id);
        List<Boolean> testPosition2 = WebTrackingController.getPositions(testShipment3.Id);
        // List<Boolean> testPositiondsa = WebTrackingController.getPositions('dsadsadsa');
        
        
        test.stopTest();
    }
}