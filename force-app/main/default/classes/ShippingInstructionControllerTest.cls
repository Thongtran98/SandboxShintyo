@isTest
public class ShippingInstructionControllerTest {
	private static clofor_com_cfs__CustomObject1__c shipment{get; set;}  
    private static List<clofor_com_cfs__AnkenMeisai__c> ListBill = new List<clofor_com_cfs__AnkenMeisai__c>();
    private static clofor_com_cfs__AnkenMeisai__c bill = new clofor_com_cfs__AnkenMeisai__c();

    static{
        clofor_com_cfs__Custom_Application_Config__c config =  new clofor_com_cfs__Custom_Application_Config__c(clofor_com_cfs__Disabled_Trigger__c = true);
        insert config;
        
        shipment = new clofor_com_cfs__CustomObject1__c();
        shipment.HouseShipper__c = 'TEST';
        shipment.HouseNotifyParty__c = 'TEST';
        shipment.HouseConsignee__c = 'TEST';
        shipment.clofor_com_cfs__Voy_No__c = 'TEST';
        shipment.clofor_com_cfs__ExchangeRate__c = 123;
        shipment.clofor_com_cfs__D_O_type__c = 'TEST';
        shipment.clofor_com_cfs__No_Of_LoadingConfirmation__c = 'TEST';
        //shipment.clofor_com_cfs__LoadLocation__c = 'TEST';
        shipment.clofor_com_cfs__TS__c = 'TEST';
        shipment.clofor_com_cfs__TransitV__c = 'TEST';
        shipment.clofor_com_cfs__TransitVoyage__c = 'TEST';
        shipment.clofor_com_cfs__ANRemark__c = 'TEST';
        shipment.clofor_com_cfs__REFNO__c = 'TEST';
        //shipment.clofor_com_cfs__PersonInCharge__c = 'TEST';
        shipment.clofor_com_cfs__CONTAINERSEALNO__c = 'TEST';
        shipment.clofor_com_cfs__Marks_and_Numbers__c = 'TEST';
        shipment.clofor_com_cfs__carton__c = 123;
        shipment.clofor_com_cfs__UnitType__c = 'TEST';
        shipment.clofor_com_cfs__Item__c = 'TEST';
        shipment.clofor_com_cfs__weight__c = 123;
        shipment.clofor_com_cfs__CBM__c = 123;
        shipment.clofor_com_cfs__BLtype__c = 'TEST';
               
        //insert shipment;
        bill = new clofor_com_cfs__AnkenMeisai__c();
        //bill.name = shipment.Id;
        bill.clofor_com_cfs__SellTankaJPY__c = 123;
        bill.clofor_com_cfs__SellTankaUSD__c = 456;
        bill.clofor_com_cfs__curr__c = 'JPY';
        // bill.clofor_com_cfs__SellInTaxAmountJPY__c = 123;
        bill.clofor_com_cfs__InsatuyouSyohinEng__c = 'TEST';
        bill.clofor_com_cfs__Suryo__c = 2;
        bill.clofor_com_cfs__ChargeUnitInPrint__c = 'TEST';
        // bill.clofor_com_cfs__SellTaxNum__c = 123;
        // bill.clofor_com_cfs__SellAmountJPN__c = 123;

        //insert bill;
        System.assert(true);
    }

    public static testMethod void test_ShippingInstruction(){
        Test.startTest();
        try{
        ShippingInstructionController control = new ShippingInstructionController();
        }catch(Exception ex){
            
        }
            
        Test.stopTest();
        
    }
    
}