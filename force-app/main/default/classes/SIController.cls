public with sharing class SIController {
    public clofor_com_cfs__CustomObject1__c shipment {get; set;}
    public clofor_com_cfs__AnkenMeisai__c billing {get; set;}
    public List<clofor_com_cfs__AnkenMeisai__c> lstbill {get; set;}
    public List<ResultWrapper> arrResult {get; set;}
    public ResultWrapper arrResult1 {get; set;}

    public String strQuery {get; set;}
    public String strQueryBill {get; set;}

    public String shipmentID {get; set;}

    private static Set<String> setFields = new Set<String>();
    private static Set<String> setFieldsBill = new Set<String>();

    public Date printDate {get; set;}

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
        setFields.add('clofor_com_cfs__PersonInCharge__c');
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
        setFields.add('clofor_com_cfs__Custom_Clearance_Broker__c'); 
        setFields.add('clofor_com_cfs__BookingNv__r.Name'); // Master Carrier/Consolidator Company Name
        setFields.add('clofor_com_cfs__LoadLocation__c'); // Warehouse
        setFields.add('clofor_com_cfs__Remarks__c'); 
        setFields.add('clofor_com_cfs__ETAAtTransitPort__c');
        setFields.add('clofor_com_cfs__T_ETD__c');
        // setFields.add('Container_Type_All__c');
        // setFields.add('clofor_com_cfs__PriceTerms__c');
        // setFields.add('clofor_com_cfs__SeikyusyoRemark__c');
        // setFields.add('clofor_com_cfs__Container_Measurement_Details__c');
        // setFields.add('clofor_com_cfs__DeadlineForPaymentOfInvoices__c');
        // setFields.add('clofor_com_cfs__QuotationVer__c');
        // setFields.add('clofor_com_cfs__ID__c');
        // setFields.add('clofor_com_cfs__WkInitial__c');
        // setFields.add('Name');
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
    public SIController() {
        shipmentID = ApexPages.currentPage().getParameters().get('id');
        Apexpages.currentPage().getHeaders().put('content-disposition', 'inline; filename=ID_Shipping Instruction_HBL/HAWB No.pdf');
        shipment = new clofor_com_cfs__CustomObject1__c();
        arrResult = new List<ResultWrapper>();
        lstbill = new List<clofor_com_cfs__AnkenMeisai__c>();
        billing = new clofor_com_cfs__AnkenMeisai__c();
        strQuery = '';
        strQueryBill = '';
        strQuery = stringQueryShipment(shipmentID);
        strQueryBill = stringQueryBill(shipmentID);
        lstbill = Database.query(strQueryBill);
        System.debug('qqqqqq :'+lstbill);
        shipment = Database.query(strQuery);
        arrResult = getDataBill(strQueryBill);
        //arrResult1 = getDataShipment();
        
    }

    public PageReference saveApex(){
        String invoiceno = ApexPages.currentPage().getParameters().get('invoiceno');
        
        String billIds = ApexPages.currentPage().getParameters().get('billIds'); 

        String shipID = ApexPages.currentPage().getParameters().get('id');
   
        List<String> lstBillIds = new List<String>();
        if(!String.isBlank(billIds)){
            lstBillIds = billIds.split(',');
            System.debug('123 :' + lstBillIds );
        }
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipID + '\'' ;
        if(lstBillIds.size() > 0){
           strWhere += ' AND Id IN : lstBillIds';
        }
        String strOrderBy = ' ORDER BY Name';
        String query = strSelect + strFrom + strWhere +strOrderBy;  
        List<clofor_com_cfs__AnkenMeisai__c> lstBill = Database.query(query);
        for (clofor_com_cfs__AnkenMeisai__c bill : lstBill){
            if (invoiceno != ''){
                bill.OutboundInvoiceNo__c = invoiceno;
            }
        }
        update lstBill;
        System.debug('hhhhhh :'+lstBill);
        return null;
    }

    private List<ResultWrapper> getDataBill(String strQueryy){
        List<ResultWrapper> results = new List<ResultWrapper>();
        List<clofor_com_cfs__AnkenMeisai__c> lstBill = new List<clofor_com_cfs__AnkenMeisai__c>();
        lstBill = Database.query(strQueryy);
        System.debug('deeeeee :'+lstBill);
        Integer count = 1;
        For (clofor_com_cfs__AnkenMeisai__c bill: lstBill){
           
            ResultWrapper item = new ResultWrapper();
            item.Index = count;
            //item.ServiceName = bill.clofor_com_cfs__InsatuyouSyohin__c;
            item.ChargeUnit = bill.clofor_com_cfs__ChargeUnitInPrint__c;
            item.Curr = bill.clofor_com_cfs__curr__c;
            item.Suryo = bill.clofor_com_cfs__Suryo__c;
            // item.TaxInitial = bill.clofor_com_cfs__TaxInitial__c;
            item.SellInTaxAmount = bill.clofor_com_cfs__SellInTaxAmountJPY__c;

            if(bill.clofor_com_cfs__curr__c == 'USD'){
                item.rate_per = bill.clofor_com_cfs__SellTankaUSD__c;
            }
            if(bill.clofor_com_cfs__curr__c == 'JPY'){
                item.rate_per = bill.clofor_com_cfs__SellTankaJPY__c;
            }
            // if(bill.clofor_com_cfs__SellTaxNum__c == 0 && bill.clofor_com_cfs__SellTaxNum__c != null){
            //     TotalAmountSellLocal += bill.clofor_com_cfs__SellAmountJPN__c;
            // }
            // if(bill.clofor_com_cfs__SellTaxNum__c > 0 && bill.clofor_com_cfs__SellTaxNum__c != null){
            //     TotalAmountSellLocalTax += bill.clofor_com_cfs__SellAmountJPN__c;
            //     TotalAmountOfTax += bill.clofor_com_cfs__SellTaxNum__c;
            // }

            // TotalAmount = TotalAmountSellLocal + TotalAmountSellLocalTax + TotalAmountOfTax;

            // if(bill.clofor_com_cfs__TaxInitial__c != null){
            //     if(bill.clofor_com_cfs__TaxInitial__c == 10){
            //         TotalAmountSellLocal10 += bill.clofor_com_cfs__SellAmountJPN__c;
            //         AmountOfTaxSellLocal10 += bill.clofor_com_cfs__SellTaxNum__c;
            //         AmountSellIncl10 += bill.clofor_com_cfs__SellInTaxAmountJPY__c;
            //     }
                
            // }
            // if(bill.clofor_com_cfs__TaxInitial__c != null){
            //     if(bill.clofor_com_cfs__TaxInitial__c == 8){
            //         TotalAmountSellLocal8 += bill.clofor_com_cfs__SellAmountJPN__c;
            //         AmountOfTaxSellLocal8 += bill.clofor_com_cfs__SellTaxNum__c;
            //         AmountSellIncl8 += bill.clofor_com_cfs__SellInTaxAmountJPY__c;
            //     }
                
            // }
            // if(bill.clofor_com_cfs__SellInTaxAmountJPY__c != null){
            //     Amount += bill.clofor_com_cfs__SellInTaxAmountJPY__c;
            // }
            count++;         
            results.add(item);   
        }  
        System.debug('kkkkkk :'+count);
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

    public class ResultWrapper{
        public clofor_com_cfs__AnkenMeisai__c bill {get; set;}
        public Integer Index {get; set;}
        public String ServiceName {get;set;}
        public String ChargeUnit {get;set;}
        public String Curr {get;set;}
        public Decimal TaxInitial {get;set;}
        public Decimal SellInTaxAmount {get;set;}
        public String OutboundInvoiceNo {get;set;}
        public Decimal rate_per {get;set;}
        public Decimal Suryo {get;set;}
        public ResultWrapper(){
            this.bill = new clofor_com_cfs__AnkenMeisai__c();
            this.Index = 0;
            this.ServiceName = '';
            this.ChargeUnit = '';
            this.Curr = '';
            this.TaxInitial = 0;
            this.SellInTaxAmount = 0;
            this.OutboundInvoiceNo = '';
            this.rate_per = 0;
            this.Suryo = 0;
        }
    }
}