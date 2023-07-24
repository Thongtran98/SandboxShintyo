public with sharing class ArrivalNoticeController {
    public clofor_com_cfs__CustomObject1__c shipment {get; set;}
    public clofor_com_cfs__AnkenMeisai__c billing {get; set;}
    public List<clofor_com_cfs__AnkenMeisai__c> lstbill {get; set;}
    public List<clofor_com_cfs__Container_Info__c> lstContainer {get; set;}
    public List<ResultWrapper> arrResult {get; set;}
    public List<ResultWrapper> arrResult1 {get; set;}
    public Boolean showREVISED{get;set;}
    public Boolean attachment{get;set;}

    public String strQuery {get; set;}
    public String strQueryBill {get; set;}
    public String strQueryContainer {get; set;}

    public String shipmentID {get; set;}

    public String customerValue {get; set;}


    private static Set<String> setFields = new Set<String>();
    private static Set<String> setFieldsBill = new Set<String>();
    private static Set<String> setFieldsContainer = new Set<String>();

    public Decimal TotalAmountSellLocal {get;set;}
    public Decimal TotalAmountSellLocalTax {get;set;}
    public Decimal TotalAmountOfTax {get;set;}
    public Decimal TotalAmount {get;set;}
    // public String filename {get;set;}
    // public String RefNo {get;set;}

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
        setFields.add('clofor_com_cfs__LoadLocation__r.Name');
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
        setFields.add('clofor_com_cfs__MBL_Number_SEA_AIR__c');
        setFields.add('clofor_com_cfs__HBL_Number_SEA_AIR__c');
        setFields.add('clofor_com_cfs__ADDRESS_ON_B_L__c');
        setFields.add('clofor_com_cfs__CNEE_ADDRESS_ON_B_L__c');
        setFields.add('clofor_com_cfs__NOTIFY_ADDRESS_ON_B_L__c');
        setFields.add('WarehousesDetailInformation__c');	
        setFields.add('clofor_com_cfs__HBL_Number_SEA_AIR__c');
        setFields.add('Container_Type_All__c');
        setFields.add('clofor_com_cfs__ContainerNumber__c');
        setFields.add('clofor_com_cfs__ContainerNumber2__c');
        setFields.add('clofor_com_cfs__ContainerNumber3__c');
        setFields.add('clofor_com_cfs__Container__c');
        setFields.add('clofor_com_cfs__Container2__c');
        setFields.add('clofor_com_cfs__Container3__c');
        // setFields.add('Container_Type_All__c');
        // setFields.add('clofor_com_cfs__PriceTerms__c');
        // setFields.add('clofor_com_cfs__SeikyusyoRemark__c');
        // setFields.add('clofor_com_cfs__Container_Measurement_Details__c');
        // setFields.add('clofor_com_cfs__DeadlineForPaymentOfInvoices__c');
        // setFields.add('clofor_com_cfs__QuotationVer__c');
        // setFields.add('clofor_com_cfs__ID__c');
        // setFields.add('clofor_com_cfs__WkInitial__c');
        setFields.add('Name');
        setFields.add('Attachment__c');
        setFields.add('clofor_com_cfs__ADDRESS_ON_B_L__c');
        setFields.add('clofor_com_cfs__NOTIFY_ADDRESS_ON_B_L__c');
        setFields.add('clofor_com_cfs__CNEE_ADDRESS_ON_B_L__c');
        setFields.add('clofor_com_cfs__Field1__c');
    }

    static{
        setFieldsBill.add('clofor_com_cfs__SellTankaJPY__c');//
        setFieldsBill.add('clofor_com_cfs__SellTankaUSD__c');
        setFieldsBill.add('clofor_com_cfs__curr__c');
        // setFieldsBill.add('clofor_com_cfs__TaxInitial__c');
        setFieldsBill.add('clofor_com_cfs__SellInTaxAmountJPY__c');
        setFieldsBill.add('clofor_com_cfs__InsatuyouSyohinEng__c'); 
        setFieldsBill.add('clofor_com_cfs__Suryo__c');
        setFieldsBill.add('clofor_com_cfs__ChargeUnitInPrint__c');
        // setFieldsBill.add('clofor_com_cfs__BLtype__c');
        // setFieldsBill.add('clofor_com_cfs__Seikyusaki__c');
        setFieldsBill.add('clofor_com_cfs__SellTaxNum__c');
        setFieldsBill.add('clofor_com_cfs__SellAmountJPN__c');
    }

    static{
        setFieldsContainer.add('clofor_com_cfs__Container_NO__c');//
        setFieldsContainer.add('clofor_com_cfs__Container__c');//
        setFieldsContainer.add('clofor_com_cfs__Seal_No__c');//
    }
    public ArrivalNoticeController() {
        
        shipmentID = ApexPages.currentPage().getParameters().get('id');
        showREVISED = Boolean.valueOf(ApexPages.currentPage().getParameters().get('showREVISED'));
        attachment = Boolean.valueOf(ApexPages.currentPage().getParameters().get('attachment'));
        // Apexpages.currentPage().getHeaders().put('content-disposition', 'inline; filename=ID_Arrival Notice_HBL/HAWB No.pdf');    
        shipment = new clofor_com_cfs__CustomObject1__c();
        arrResult = new List<ResultWrapper>();
        arrResult1 = new List<ResultWrapper>();
        lstbill = new List<clofor_com_cfs__AnkenMeisai__c>();
        billing = new clofor_com_cfs__AnkenMeisai__c();
        lstContainer = new List<clofor_com_cfs__Container_Info__c>();
        strQuery = '';
        strQueryBill = '';
        strQueryContainer = '';
        customerValue = '';
        TotalAmountSellLocal = 0;
        TotalAmountSellLocalTax = 0;
        TotalAmountOfTax = 0;
        TotalAmount = 0;
        strQuery = stringQueryShipment(shipmentID);
        
        strQueryContainer = stringQueryConainer(shipmentID);
        lstContainer= Database.query(strQueryContainer);
        
        shipment = Database.query(strQuery);
        customerValue = shipment.clofor_com_cfs__Field1__c;
        strQueryBill = stringQueryBill2(shipmentID, customerValue);
        lstbill = Database.query(strQueryBill);
        System.debug('checkbill :'+lstbill);
        arrResult = getDataBill(strQueryBill);
        

        //arrResult1 = getDataShipment();
        String filename = shipment.clofor_com_cfs__REFNO__c + '_Arrival Notice_' + shipment.clofor_com_cfs__HBL_Number_SEA_AIR__c;
        Apexpages.currentPage().getHeaders().put('content-disposition', 'inline; filename=\"'+filename+'\"');

        Integer a = 0;
        if (arrResult.size()<14){
            a = 14-arrResult.size();
            
        }
        for(Integer i = 0; i<=a;i++){
            ResultWrapper arr = new ResultWrapper();
            arrResult1.add(arr);
        }
    }

 

    private List<ResultWrapper> getDataBill(String strQueryy){
        List<ResultWrapper> results = new List<ResultWrapper>();
        List<clofor_com_cfs__AnkenMeisai__c> lstBill = new List<clofor_com_cfs__AnkenMeisai__c>();
        lstBill = Database.query(strQueryy);
        System.debug('check :'+lstBill);
        For (clofor_com_cfs__AnkenMeisai__c bill: lstBill){
           
            ResultWrapper item = new ResultWrapper();
            //item.ServiceName = bill.clofor_com_cfs__InsatuyouSyohin__c;
            item.ChargeUnit = bill.clofor_com_cfs__ChargeUnitInPrint__c;
            item.Curr = bill.clofor_com_cfs__curr__c;
            item.Suryo = bill.clofor_com_cfs__Suryo__c;
            item.Amount = bill.clofor_com_cfs__SellAmountJPN__c;
            item.Tax = bill.clofor_com_cfs__SellTaxNum__c;
            item.FreightCharge = bill.clofor_com_cfs__InsatuyouSyohinEng__c;
            // item.TaxInitial = bill.clofor_com_cfs__TaxInitial__c;
            item.SellInTaxAmount = bill.clofor_com_cfs__SellInTaxAmountJPY__c;

            if(bill.clofor_com_cfs__curr__c == 'USD'){
                item.rate_per = bill.clofor_com_cfs__SellTankaUSD__c;
            }
            if(bill.clofor_com_cfs__curr__c == 'JPY'){
                item.rate_per = bill.clofor_com_cfs__SellTankaJPY__c;
            }
            if(bill.clofor_com_cfs__SellTaxNum__c == 0 && bill.clofor_com_cfs__SellTaxNum__c != null){
                TotalAmountSellLocal += item.Amount;
            }
            if(bill.clofor_com_cfs__SellTaxNum__c > 0 && bill.clofor_com_cfs__SellTaxNum__c != null){
                TotalAmountSellLocalTax += item.Amount;
                TotalAmountOfTax += item.Tax;
            }

            TotalAmount = TotalAmountSellLocal + TotalAmountSellLocalTax + TotalAmountOfTax;           
            
            results.add(item);     
        }  
        return results;        
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
     private String stringQueryBill2(String shipmentID, String customerValue){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere = ' WHERE clofor_com_cfs__Anken__c = \'' + shipmentID + '\' AND clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__PrintFlag__c = true';
        String strOrderBy = ' ORDER BY clofor_com_cfs__SeikyuBangou__c';
        return strSelect + strFrom + strWhere + strOrderBy;
    }

     private String stringQueryConainer(String shipmentId){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsContainer), ',');
        String strFrom = ' FROM clofor_com_cfs__Container_Info__c ';
        String strWhere = 'WHERE clofor_com_cfs__HBL_SHIPMENT__c = \'' + shipmentId + '\'';
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy; 
    }

    public class ResultWrapper{
        public clofor_com_cfs__AnkenMeisai__c bill {get; set;}
        public String ChargeUnit {get;set;}
        public String Curr {get;set;}
        public Decimal SellInTaxAmount {get;set;}
        public Decimal rate_per {get;set;}
        public Decimal Suryo {get;set;}
        public String FreightCharge {get;set;}
        public Decimal Amount {get;set;}
        public Decimal Tax {get;set;}
        public ResultWrapper(){
            this.bill = new clofor_com_cfs__AnkenMeisai__c();
            this.ChargeUnit = '';
            this.Curr = '';
            this.SellInTaxAmount = 0;
            this.rate_per = 0;
            this.Suryo = 0;
            this.FreightCharge = '';
            this.Amount = 0;
            this.Tax = 0;
        }
    }
}