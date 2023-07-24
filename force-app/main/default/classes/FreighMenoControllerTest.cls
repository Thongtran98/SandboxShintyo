@isTest
public with sharing class FreighMenoControllerTest {
    private static clofor_com_cfs__CustomObject1__c shipment{get; set;}
    private static clofor_com_cfs__AnkenMeisai__c bill{get; set;}
    private static clofor_com_cfs__AnkenMeisai__c customer{get; set;}
    private static List<clofor_com_cfs__AnkenMeisai__c> lstbill{get; set;}
    private static Set<String> setFields = new Set<String>();
    static{
        setFields.add('Name');
    }
    public static testMethod void checkFreighMenoC() {
        
        Test.startTest();
         clofor_com_cfs__Site_Custom_Settings__c scs = new clofor_com_cfs__Site_Custom_Settings__c(clofor_com_cfs__FCY_Currency__c = 'USD',clofor_com_cfs__Local_Currency__c = 'VND',clofor_com_cfs__Company_Country__c = 'Viet Nam');
        insert scs;
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
        
        clofor_com_cfs__TariffMaster__c ser = new clofor_com_cfs__TariffMaster__c(Name = 'testService');
        insert ser; 
        
        clofor_com_cfs__Custom_Clearance__c cc = new clofor_com_cfs__Custom_Clearance__c(clofor_com_cfs__HBL_SHIPMENT__c = ship.Id);
        insert cc;
        
        List<clofor_com_cfs__AnkenMeisai__c> lstBill  = new List<clofor_com_cfs__AnkenMeisai__c>();
        clofor_com_cfs__AnkenMeisai__c bill = new clofor_com_cfs__AnkenMeisai__c(clofor_com_cfs__Anken__c =ship.Id,
                                                                                 clofor_com_cfs__Seikyusaki__c= ac.Id,
                                                                                 clofor_com_cfs__Tariff__c =ser.Id,
                                                                                 clofor_com_cfs__Description__c  = 'testDescription12345',
                                                                                 clofor_com_cfs__Suryo__c = 2,
                                                                                 clofor_com_cfs__SellTankaUSD__c = 120000,
                                                                                 clofor_com_cfs__ChargeUnit__c = 'CBM',
                                                                                 clofor_com_cfs__PrintFlag__c = true
                                                                                );
         lstBill.add(bill);
        clofor_com_cfs__AnkenMeisai__c bill2 = new clofor_com_cfs__AnkenMeisai__c(clofor_com_cfs__Anken__c =ship.Id,
                                                                                 clofor_com_cfs__Tariff__c =ser.Id,
                                                                                 clofor_com_cfs__Description__c  = 'testDescription1',
                                                                                 clofor_com_cfs__Suryo__c = 111,
                                                                                 clofor_com_cfs__SellTankaUSD__c = 1001001,
                                                                                 clofor_com_cfs__ChargeUnit__c = 'CBM',
                                                                                 
                                                                                 clofor_com_cfs__Seikyusaki__c = ac.Id
                                                                                );
        lstBill.add(bill2);
        insert lstBill;
       
        clofor_com_cfs__Container_Info__c conf1 = new clofor_com_cfs__Container_Info__c(clofor_com_cfs__Container_NO__c = 'number test 123',clofor_com_cfs__Seal_No__c = 'seal number 123',clofor_com_cfs__Container__c = 'container', clofor_com_cfs__QUANTITY_PACKAGES__c = 1, clofor_com_cfs__GROSS_WEIGHT__c = 2, clofor_com_cfs__MEASUREMENT_CBM__c = 3, clofor_com_cfs__HBL_SHIPMENT__c = ship.Id);
        insert conf1;
        
        PageReference pageRef = Page.page_FreighMeno;
        pageRef.getParameters().put('Id', ship.Id);
        Test.setCurrentPage(pageRef);
        FreighMenoController fe = new FreighMenoController();
        
        ApexPages.currentPage().getParameters().put('shipmentId', ship.Id);
        //fe.stringQueryShipment() = [SELECT Id, Name FROM clofor_com_cfs__CustomObject1__c WHERE Id =: shipmentId LIMIT 1];
        //List<clofor_com_cfs__AnkenMeisai__c> lstbill = fe.stringQueryBill(ship.Id);
        //fe.redirPage();
        List<SelectOption> itemOptions = fe.getCustomerList();
        List<SelectOption> fileOptions = fe.getFileTypeOptions();
        // List<SelectOption> invoiceNoOptions = taxInvoice.getInvoiceNoOptions(); 
        Test.stopTest();
}
}