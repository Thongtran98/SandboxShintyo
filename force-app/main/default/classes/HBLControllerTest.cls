@isTest
public with sharing class HBLControllerTest {
    private static clofor_com_cfs__CustomObject1__c shipment{get; set;}
    public static testMethod void CheckHBLControllerTest() {
        Test.startTest();
        Account ac = new Account(
            Name = 'Customer service',                             // Business Relationship
            Account_Name_JP__c = 'Customer service123123',                                                                   // Account Name
                                                     // Tax Code
                                                  // Customer Type
            clofor_com_cfs__CompanyShortName__c = '495 TO HIEN THANH STR, WARD 14, DISTRICT 10,',  // English Address
            clofor_com_cfs__CustomerType__c = 'Others'                               // Mail
        );
        insert ac;
        
        clofor_com_cfs__CustomObject1__c ship = new clofor_com_cfs__CustomObject1__c(clofor_com_cfs__ETD__c =  Date.newInstance(2021, 1, 1),
                                                  clofor_com_cfs__ETA__c =  Date.newInstance(2021, 3, 20),
                                                                                     clofor_com_cfs__Field1__c = ac.Id);
        insert ship;

        PageReference pageRef = Page.page_HBL;
        pageRef.getParameters().put('Id', ship.Id);
        Test.setCurrentPage(pageRef);
        HBLController fe = new HBLController();
        
        ApexPages.currentPage().getParameters().put('shipmentId', ship.Id);

        List<SelectOption> itemOptions = fe.getSortOptions();
        Test.stopTest();
    }
}