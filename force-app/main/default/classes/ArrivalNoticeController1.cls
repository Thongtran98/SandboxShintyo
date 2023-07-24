public with sharing class ArrivalNoticeController1 {
    public clofor_com_cfs__AnkenMeisai__c billing2 {get; set;}

    public clofor_com_cfs__CustomObject1__c shipment {get; set;}

    public Boolean showREVISED{get;set;}

    public Boolean attachment{get;set;}

    public String fileType { get; set; }

    public String shipmentID { get; set; }

    public String strQuery {get; set;}

    public String InvoiceNo {get;set;}

    public String strQueryBill2 {get; set;}

    public String foreignCur {get; set;}

    public String localCur {get; set;}

    public Map<String, String> translations { get; set; }

    public String language { get; set; }

    public String customerValue {get; set;}

    public List<ResultWrapper2> arrResult2 {get; set;}

    private static Set<String> setFields = new Set<String>();

    private static Set<String> setFieldsBill = new Set<String>();

    static{
        setFields.add('clofor_com_cfs__REFNO__c');
        setFields.add('clofor_com_cfs__HBL_Number_SEA_AIR__c');
        setFields.add('clofor_com_cfs__MBL_Number_SEA_AIR__c');
        setFields.add('clofor_com_cfs__VESSEL_FLIGHT__c');
        setFields.add('clofor_com_cfs__Voy_No__c');
        setFields.add('clofor_com_cfs__TranporationType__c');
        setFields.add('clofor_com_cfs__PortOfLoadingDetailPrint__c');
        setFields.add('clofor_com_cfs__PortOfDischargeDetailPrint__c');
        setFields.add('clofor_com_cfs__carton__c' );
        setFields.add('clofor_com_cfs__UnitType__c');
        setFields.add('clofor_com_cfs__ETA__c');
        setFields.add('clofor_com_cfs__ETD__c');
        setFields.add('clofor_com_cfs__weight__c');
        setFields.add('Container_Type_All__c');
        setFields.add('clofor_com_cfs__PriceTerms__c');
        setFields.add('clofor_com_cfs__SeikyusyoRemark__c');
        setFields.add('clofor_com_cfs__Container_Measurement_Details__c');
        setFields.add('clofor_com_cfs__DeadlineForPaymentOfInvoices__c');
        setFields.add('clofor_com_cfs__QuotationVer__c');
        setFields.add('clofor_com_cfs__ID__c');
        setFields.add('clofor_com_cfs__WkInitial__c');
        setFields.add('Name');
        setFields.add('RecordTypeId');
        setFields.add('clofor_com_cfs__ExchangeRate__c');
        setFields.add('clofor_com_cfs__SeikyusyoRemark__c');
        setFields.add('clofor_com_cfs__CBM__c');
        setFields.add('Invoice_Remark__c');
        setFields.add('clofor_com_cfs__Field1__c');
    }

    static{
        setFieldsBill.add('clofor_com_cfs__InsatuyouSyohin__c');
        setFieldsBill.add('clofor_com_cfs__ChargeUnitInPrint__c');
        setFieldsBill.add('clofor_com_cfs__curr__c');
        setFieldsBill.add('clofor_com_cfs__TaxInitial__c');
        setFieldsBill.add('clofor_com_cfs__SellInTaxAmountJPY__c');
        setFieldsBill.add('clofor_com_cfs__SellTankaUSD__c');
        setFieldsBill.add('clofor_com_cfs__SellAmountJPN__c');
        setFieldsBill.add('clofor_com_cfs__SellTaxNum__c');
        setFieldsBill.add('clofor_com_cfs__SellInTaxAmountJPY__c');
        setFieldsBill.add('clofor_com_cfs__Seikyusaki__c');
        setFieldsBill.add('clofor_com_cfs__Seikyusaki__r.Name');
        setFieldsBill.add('AN_No__c');
        setFieldsBill.add('clofor_com_cfs__SellTankaJPY__c');
        setFieldsBill.add('clofor_com_cfs__Suryo__c');
        setFieldsBill.add('Name');
    }
    //comment
    public ArrivalNoticeController1() {
        billing2 = new clofor_com_cfs__AnkenMeisai__c();
        shipment = new clofor_com_cfs__CustomObject1__c();
        showREVISED =  false;
        attachment = false;
        fileType = 'pdf';
        language = 'en';
        strQuery = '';
        strQueryBill2 = '';
        InvoiceNo = '';
        customerValue = '';
        shipmentID = ApexPages.currentPage().getParameters().get('id');
        strQuery = stringQueryShipment(shipmentID);
        shipment = Database.query(strQuery);
        arrResult2 = new List<ResultWrapper2>();
        customerValue = shipment.clofor_com_cfs__Field1__c;
        strQueryBill2 = stringQueryBill2(shipmentID,customerValue);
        System.debug('strQueryBill2 :'+strQueryBill2);

        System.debug('customerValue :'+customerValue);
        billing2 = Database.query(stringQueryBilling3(shipmentID,customerValue));
        
        InvoiceNo = getDataShipment();

        arrResult2 = getDataBill2(strQueryBill2);

        clofor_com_cfs__Site_Custom_Settings__c customSettings = [
            SELECT clofor_com_cfs__FCY_Currency__c,
            clofor_com_cfs__Local_Currency__c
            FROM clofor_com_cfs__Site_Custom_Settings__c limit 1];


        foreignCur = customSettings.clofor_com_cfs__FCY_Currency__c;
        localCur = customSettings.clofor_com_cfs__Local_Currency__c;
        
    }

    public void generateAttachmentFile(){
        PageReference pageTo;
    }

    public PageReference closePopupDialog() {
      PageReference page = new PageReference('/'+shipmentID);
      page.setRedirect(true);
      return page;
    }
    private String getDataShipment(){
        clofor_com_cfs__CustomObject1__c item = new clofor_com_cfs__CustomObject1__c();
        String strSelect = 'SELECT ' + String.join(new List<String>(setFields), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
        String strWhere = 'WHERE Id = \'' + shipmentId + '\'' ;
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        String data = strSelect + strFrom + strWhere + strOrderBy;
        item = Database.query(data);

        List<clofor_com_cfs__AnkenMeisai__c> bill = new List<clofor_com_cfs__AnkenMeisai__c>();
        String strSelect2 = 'SELECT Id, Name,AN_No__c';
        String strFrom2 = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere2 = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\'' ;
        String strOrderBy2 = ' ORDER BY Name';
        String data2 = strSelect2 + strFrom2 + strWhere2 + strOrderBy2;
        bill = Database.query(data2);
        System.debug('billlll :'+bill);
        List<Decimal> billDecimal = new List<Decimal>();
        String test123 = '';
            for(clofor_com_cfs__AnkenMeisai__c e : bill){
                if(e.AN_No__c != null){
                    billDecimal.add(Decimal.valueOf(e.AN_No__c.substringAfter('-')));
                }else{
            
                    billDecimal.add(0);   
                }
            }

        System.debug('billDecimal :'+billDecimal);
        Decimal maxvalue = billDecimal[0];
        for(Integer i = 0; i < billDecimal.size(); i++){
            if(billDecimal[i] > maxvalue){
                maxvalue = billDecimal[i];
            }
        }

        System.debug('maxvalue :'+maxvalue);
        Decimal maxvaluemax = maxvalue+1;
        // String invoiceoutbound =item.Name +'_請求書_'+ item.clofor_com_cfs__HBL_Number_SEA_AIR__c ;
        String invoiceoutbound = 'AN'+item.Name+'-'+ maxvaluemax;
        System.debug('invoiceoutbound :'+invoiceoutbound.substringAfter('-'));
        return invoiceoutbound;
    }

    public PageReference saveApex(){
        String invoiceno = ApexPages.currentPage().getParameters().get('invoiceno');
        System.debug('invoiceno :'+invoiceno);

        String billIds = ApexPages.currentPage().getParameters().get('billIds');
        
        List<String> lstBillIds = new List<String>();
        if(!String.isBlank(billIds)){
            lstBillIds = billIds.split(',');
            
        }
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere = ' WHERE clofor_com_cfs__Anken__c = \'' + shipmentID + '\' AND clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__PrintFlag__c = true';
        String strOrderBy = ' ORDER BY clofor_com_cfs__SeikyuBangou__c';
        String query = strSelect + strFrom + strWhere +strOrderBy;  
        List<clofor_com_cfs__AnkenMeisai__c> lstBill = Database.query(query);
        for (clofor_com_cfs__AnkenMeisai__c bill : lstBill){
            bill.AN_No__c = invoiceno;
        }
        System.debug('ThongDebug :'+lstBill);
        update lstBill;
        
        return null;
    }

    private List<ResultWrapper2> getDataBill2(String strQuery){
        List<ResultWrapper2> results = new List<ResultWrapper2>();
        List<clofor_com_cfs__AnkenMeisai__c> lstBill = new List<clofor_com_cfs__AnkenMeisai__c>();
        lstBill = Database.query(strQuery);
        
        Integer count = 1;
        For (clofor_com_cfs__AnkenMeisai__c bill: lstBill){
            
            ResultWrapper2 item = new ResultWrapper2();
            item.Id = bill.Id;
            item.Index2 = count;
            item.ServiceName2 = bill.clofor_com_cfs__InsatuyouSyohin__c;
            item.ChargeUnit2 = bill.clofor_com_cfs__ChargeUnitInPrint__c;
            item.Curr2 = bill.clofor_com_cfs__curr__c;
            item.TaxInitial2 = bill.clofor_com_cfs__TaxInitial__c;
            item.SellInTaxAmount2 = bill.clofor_com_cfs__SellInTaxAmountJPY__c;
            item.SellTankaJPY2 = bill.clofor_com_cfs__SellTankaJPY__c;
            item.SellTankaUSD2 = bill.clofor_com_cfs__SellTankaUSD__c;
            item.SellAmountJPN2 =bill.clofor_com_cfs__SellAmountJPN__c;
            item.Quantity2 = bill.clofor_com_cfs__Suryo__c;
            item.ANNo2 = bill.AN_No__c;

            count++;
            
            results.add(item);
            
      
        }  
        System.debug('kkkkkk :'+count);
        return results;
        
    }
    private String stringQueryShipment(String shipmentId){
        String strSelect = 'SELECT RecordType.Name,' + String.join(new List<String>(setFields), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
        String strWhere = 'WHERE Id = \'' + shipmentId + '\'' ;
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
    private String stringQueryBilling3(String shipmentID, String customerValue){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere = ' WHERE clofor_com_cfs__Anken__c = \'' + shipmentID + '\' AND clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__PrintFlag__c = true';
        String strOrderBy = ' ORDER BY clofor_com_cfs__SeikyuBangou__c LIMIT 1';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
    private String stringQueryBill2(String shipmentID, String customerValue){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere = ' WHERE clofor_com_cfs__Anken__c = \'' + shipmentID + '\' AND clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__PrintFlag__c = true';
        String strOrderBy = ' ORDER BY clofor_com_cfs__SeikyuBangou__c';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
    public class ResultWrapper2{
        // public clofor_com_cfs__AnkenMeisai__c bill2 {get; set;} {}
        public String Id {get;set;}
        public Integer Index2 {get; set;}
        public String ServiceName2 {get;set;}
        public String ChargeUnit2 {get;set;}
        public String Curr2 {get;set;}
        public Decimal TaxInitial2 {get;set;}
        public Decimal SellInTaxAmount2 {get;set;}
        public String ANNo2 {get;set;}
        public Decimal SellTankaJPY2 {get; set;}
        public Decimal SellTankaUSD2 {get; set;}
        public Decimal SellAmountJPN2 {get; set;}
        public Decimal Quantity2 {get; set;}
        public ResultWrapper2(){
            // this.bill2 = new clofor_com_cfs__AnkenMeisai__c();
            this.Id = '';
            this.Index2 = 0;
            this.ServiceName2 = '';
            this.ChargeUnit2 = '';
            this.Curr2 = '';
            this.TaxInitial2 = 0;
            this.SellInTaxAmount2 = 0;
            SellTankaUSD2 = 0;
            SellTankaJPY2 = 0;
            SellAmountJPN2 = 0;
            Quantity2 = 0;
            this.ANNo2 = '';
        }
    }
}