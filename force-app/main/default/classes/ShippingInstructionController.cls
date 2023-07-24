public with sharing class ShippingInstructionController {
    public clofor_com_cfs__CustomObject1__c shipment {get; set;}
    public clofor_com_cfs__AnkenMeisai__c billing {get; set;}
    public List<clofor_com_cfs__AnkenMeisai__c> lstbill {get; set;}
    public List<clofor_com_cfs__Container_Info__c> lstContainer {get; set;}

    public Boolean showInfo{get;set;}
    public Boolean attachment{get;set;}
    // public String filename {get;set;}
    // public String RefNo {get;set;}
    // public String fileType {get; set;}
    // public String id {get; set;}

    public String strQuery {get; set;}
    public String strQueryBill {get; set;}
    public String strQueryContainer {get; set;}
    public Datetime cargoTime {get; set;}
    public Datetime docTime {get; set;}
    
    public String shipmentID {get; set;}

    private static Set<String> setFields = new Set<String>();
    private static Set<String> setFieldsBill = new Set<String>();
    private static Set<String> setFieldsContainer = new Set<String>();

    static{
        setFields.add('HouseShipper__c');
        setFields.add('HouseNotifyParty__c');
        setFields.add('HouseConsignee__c');
        setFields.add('clofor_com_cfs__PlaceOfReceiptDetailPrint__c');
        setFields.add('clofor_com_cfs__Voy_No__c');
        setFields.add('clofor_com_cfs__ExchangeRate__c');
        setFields.add('clofor_com_cfs__PortOfLoadingDetailPrint__c');
        setFields.add('clofor_com_cfs__PortOfDischargeDetailPrint__c');
        setFields.add('clofor_com_cfs__PlaceOfDeliveryDetailPrint__c' );
        setFields.add('clofor_com_cfs__VESSEL_FLIGHT__c');
        setFields.add('clofor_com_cfs__ETA__c');
        setFields.add('clofor_com_cfs__ETD__c');
        setFields.add('clofor_com_cfs__D_O_type__c');
        setFields.add('clofor_com_cfs__No_Of_LoadingConfirmation__c');
        setFields.add('clofor_com_cfs__LoadLocation__c');
        setFields.add('clofor_com_cfs__TS__c');
        setFields.add('clofor_com_cfs__TransitV__c');
        setFields.add('clofor_com_cfs__TransitVoyage__c');
        setFields.add('clofor_com_cfs__FreeDemurrageTime__c');
        setFields.add('clofor_com_cfs__FreeDetentionTime__c');
        setFields.add('clofor_com_cfs__ANRemark__c');
        setFields.add('clofor_com_cfs__REFNO__c');
        setFields.add('clofor_com_cfs__PersonInCharge__r.Name');
        setFields.add('clofor_com_cfs__CONTAINERSEALNO__c ');
        setFields.add('clofor_com_cfs__Marks_and_Numbers__c');
        setFields.add('clofor_com_cfs__carton__c');
        setFields.add('clofor_com_cfs__UnitType__c');
        setFields.add('clofor_com_cfs__Item__c');
        setFields.add('clofor_com_cfs__weight__c');
        setFields.add('clofor_com_cfs__CBM__c');
        setFields.add('clofor_com_cfs__ETD__c');
        setFields.add('clofor_com_cfs__ETD__c'); 
        setFields.add('clofor_com_cfs__BLtype__c');
        setFields.add('clofor_com_cfs__Master_BL_Type__c'); 
        setFields.add('clofor_com_cfs__Master_No_of_Original_B_s_L__c'); 
        setFields.add('clofor_com_cfs__CARGO_TYPE__c'); 
        setFields.add('clofor_com_cfs__CutDay__c'); 
        setFields.add('clofor_com_cfs__Custom_Clearance_Broker__r.Name'); 
        setFields.add('clofor_com_cfs__BookingNv__r.Name'); // Master Carrier/Consolidator Company Name
        setFields.add('clofor_com_cfs__LoadLocation__r.Name'); // Warehouse
        setFields.add('clofor_com_cfs__Remarks__c'); 
        setFields.add('clofor_com_cfs__ETAAtTransitPort__c');
        setFields.add('clofor_com_cfs__T_ETD__c');
        setFields.add('clofor_com_cfs__MASTER_BOOKINGNO__c');
        setFields.add('clofor_com_cfs__MFreight_Collect_Prepaid__c');
        setFields.add('clofor_com_cfs__Master_No_of_Original_B_s_L__c');
        setFields.add('WarehousesDetailInformation__c');
        setFields.add('clofor_com_cfs__HBL_Number_SEA_AIR__c');
        setFields.add('clofor_com_cfs__DeliveryAgent__r.InformationonBL__c');
        setFields.add('clofor_com_cfs__DeliveryAgent__r.clofor_com_cfs__EnglishCompanyName__c');
        setFields.add('clofor_com_cfs__DeliveryAgent__r.clofor_com_cfs__EnglishAddress__c');
        setFields.add('clofor_com_cfs__DeliveryAgent__r.Phone');
        setFields.add('clofor_com_cfs__DeliveryAgent__r.Fax');
        setFields.add('Container_Type_All__c');
        setFields.add('MasterShipper__c');
        setFields.add('MasterConsignee__c');
        setFields.add('MasterNotifyParty__c');
        setFields.add('Attachment__c');
        setFields.add('clofor_com_cfs__CARGO_CLOSING_TIME__c');
        setFields.add('clofor_com_cfs__DOCUMENT_CLOSING_TIME__c');
    }

    static{
        setFieldsBill.add('clofor_com_cfs__SellTankaJPY__c');//
        setFieldsBill.add('clofor_com_cfs__SellTankaUSD__c');
        setFieldsBill.add('clofor_com_cfs__curr__c');
        setFieldsBill.add('clofor_com_cfs__TaxInitial__c');
        setFieldsBill.add('clofor_com_cfs__SellInTaxAmountJPY__c');
        setFieldsBill.add('clofor_com_cfs__InsatuyouSyohinEng__c'); 
        setFieldsBill.add('clofor_com_cfs__Suryo__c');
        setFieldsBill.add('clofor_com_cfs__ChargeUnitInPrint__c');
        // setFieldsBill.add('clofor_com_cfs__BLtype__c');
        setFieldsBill.add('clofor_com_cfs__Seikyusaki__c');
        setFieldsBill.add('clofor_com_cfs__SellTaxNum__c');
        setFieldsBill.add('clofor_com_cfs__SellAmountJPN__c');
    }

    static{
        setFieldsContainer.add('clofor_com_cfs__Container_NO__c');//
        setFieldsContainer.add('clofor_com_cfs__Container__c');//
        setFieldsContainer.add('clofor_com_cfs__Seal_No__c');//
    }

    public ShippingInstructionController() {
        // showInfo =  false;
        // fileType = 'pdf';
        // id = ApexPages.currentPage().getParameters().get('id').escapeHtml4();
        shipmentID = ApexPages.currentPage().getParameters().get('id');
        attachment = Boolean.valueOf(ApexPages.currentPage().getParameters().get('attachment'));
        showInfo = Boolean.valueOf(ApexPages.currentPage().getParameters().get('showInfo'));
        System.debug('abcde' + showInfo);
        // Apexpages.currentPage().getHeaders().put('content-disposition', 'inline; filename=ID_Shipping Instruction_HBL/HAWB No.pdf');
        shipment = new clofor_com_cfs__CustomObject1__c();
        lstbill = new List<clofor_com_cfs__AnkenMeisai__c>();
        billing = new clofor_com_cfs__AnkenMeisai__c();
        lstContainer = new List<clofor_com_cfs__Container_Info__c>();
        strQuery = '';
        strQueryBill = '';
        strQueryContainer = '';
        strQuery = stringQueryShipment(shipmentID);
        strQueryBill = stringQueryBill(shipmentID);
        strQueryContainer = stringQueryConainer(shipmentID);
        lstbill = Database.query(strQueryBill);
        System.debug('checkbill :'+lstbill);
        shipment = Database.query(strQuery);
        lstContainer= Database.query(strQueryContainer);
        //arrResult1 = getDataShipment();
        String filename = shipment.clofor_com_cfs__REFNO__c + '_Shipping Instruction_' + shipment.clofor_com_cfs__HBL_Number_SEA_AIR__c;
        Apexpages.currentPage().getHeaders().put('content-disposition', 'inline; filename=\"'+filename+'\"');
        // Apexpages.currentPage().getHeaders().put('content-disposition', 'inline; filename=\"'+RefNo+filename+'\"');
        if(shipment.clofor_com_cfs__CARGO_CLOSING_TIME__c != null){
            cargoTime = shipment.clofor_com_cfs__CARGO_CLOSING_TIME__c.addHours(9);
        }
        if(shipment.clofor_com_cfs__DOCUMENT_CLOSING_TIME__c != null){
            docTime = shipment.clofor_com_cfs__DOCUMENT_CLOSING_TIME__c.addHours(9);
        }
    }
      
    
    private String stringQueryShipment(String shipmentId){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFields), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
        String strWhere = 'WHERE Id = \'' + shipmentId + '\'' ;
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        return strSelect + strFrom + strWhere + strOrderBy;
    }

    private String stringQueryBill(String shipmentId){
         String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
         String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
         String strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\'';
         String strOrderBy = ' ORDER BY Name';
         return strSelect + strFrom + strWhere + strOrderBy; 
     }

     private String stringQueryConainer(String shipmentId){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsContainer), ',');
        String strFrom = ' FROM clofor_com_cfs__Container_Info__c ';
        String strWhere = 'WHERE clofor_com_cfs__HBL_SHIPMENT__c = \'' + shipmentId + '\'';
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy; 
    }
    //  public void generateAttachmentFile(){
    //     PageReference pageTo;
    // }

    // public PageReference closePopupDialog() {
    //   PageReference page = new PageReference('/'+id);
    //   page.setRedirect(true);
    //   return page;
    // }

}