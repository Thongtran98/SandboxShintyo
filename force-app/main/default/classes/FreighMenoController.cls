public with sharing class FreighMenoController {
    public clofor_com_cfs__CustomObject1__c shipment {get; set;}
    public clofor_com_cfs__AnkenMeisai__c billing {get; set;}
    public clofor_com_cfs__AnkenMeisai__c billing2 {get; set;}
    public clofor_com_cfs__AnkenMeisai__c customer {get; set;}
    public List<clofor_com_cfs__AnkenMeisai__c> lstbill {get; set;}
    public List<ResultWrapper> arrResult {get; set;}
    public List<ResultWrapper2> arrResult2 {get; set;}
    public List<ResultWrapper> arrResult3 {get; set;}
    public List<ResultWrapper2> arrResult4 {get; set;}
    public ResultWrapper arrResult1 {get; set;}
    public Set<String> listOubound {get; set;}
    public List<String> listOubound2 {get; set;}

    public String strQuery {get; set;}
    public String strQueryBill {get; set;}
    public String strQueryBilling {get; set;}
    public String strQueryBill2 {get; set;}
    public String strQueryBill3 {get; set;}
    public String reportType{get;set;}
    public String ContainerDetail {get;set;}
    

    public String shipmentID {get; set;}
    public String shipID {get; set;}
    public String InvoiceValue {get; set;}
    public String customerValue {get; set;}
    public Date printDate {get; set;}
    public Decimal rowcount {get;set;}
    public String foreignCur {get; set;}
    public String localCur {get; set;}
    public String IdCustomFirst {get;set;}
    
    public String strQueryCustomer {get;set;}
    

    private static Set<String> setFields = new Set<String>();
    private static Set<String> setFieldsBill = new Set<String>();

    public Decimal TotalAmountSellLocal10 {get;set;}
    public Decimal TotalAmountSellLocal8 {get;set;}
    public Decimal AmountOfTaxSellLocal10 {get; set;}
    public Decimal AmountOfTaxSellLocal8 {get; set;}
    public Decimal AmountSellIncl10 {get;set;}
    public Decimal AmountSellIncl8 {get;set;}
    public Decimal Amount {get;set;}
    public Decimal TotalAmount18 {get;set;}
    public Decimal TotalTax18 {get;set;}

    

    public Map<String, String> translations{get; set;}
    public String language{get; set;}
    public String docType{get; set;}
    public Boolean requiredAttachmentCreation{get; set;}
    public String ouboundValue{get; set;}
    public String currencyType{get; set;}
    public String customerId{get;set;}
    public String ouboundId{get;set;}
    public String companyjapan{get;set;}
    public String bankType{get;set;}
    public String templateType{get;set;}
    public String fileType{get;set;}
    public String attachName{get;set;}
    public Boolean showContainer{get; set;}
    public Boolean showSignature{get; set;}
    public String InvoiceNo {get;set;}
    public String formno {get;set;}

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
        setFieldsBill.add('clofor_com_cfs__OutboundVATInvNo__c');
        setFieldsBill.add('clofor_com_cfs__SellTankaJPY__c');
        setFieldsBill.add('clofor_com_cfs__Suryo__c');
        setFieldsBill.add('Name');
    }
    public FreighMenoController() {
        System.debug('1DEBUG:' + UserInfo.getLanguage()) ;
        shipmentID = ApexPages.currentPage().getParameters().get('id');
        
        // shipID = ApexPages.currentPage().getParameters().get('Seikyusaki');
        // System.debug('shipID :'+shipID);
        shipment = new clofor_com_cfs__CustomObject1__c();
        arrResult = new List<ResultWrapper>();
        arrResult2 = new List<ResultWrapper2>();
        arrResult3 = new List<ResultWrapper>();
        arrResult4 = new List<ResultWrapper2>();
        lstbill = new List<clofor_com_cfs__AnkenMeisai__c>();
        billing = new clofor_com_cfs__AnkenMeisai__c();
        billing2 = new clofor_com_cfs__AnkenMeisai__c();
        strQuery = '';
        strQueryBill = '';
        strQueryBilling = '';
        strQueryBill2 = '';
        strQueryBill3 = '';
        ContainerDetail = '';
        ouboundValue = '';
        InvoiceValue = '';
        formno = '';
        listOubound = new Set<String>();
        listOubound2 = new List<String>();
        rowcount = 0;
        printDate = System.today();
        String temp;
        String temp2;
        InvoiceValue = ApexPages.currentPage().getParameters().get('Invoice');
        System.debug('InvoiceValue :'+InvoiceValue);
        customerValue = ApexPages.currentPage().getParameters().get('customerValue');
        System.debug('customerValue :'+customerValue);
        formno = ApexPages.currentPage().getParameters().get('InvoiceNo');
        // String temp = String.valueOf([Select clofor_com_cfs__Seikyusaki__c From clofor_com_cfs__AnkenMeisai__c where clofor_com_cfs__Anken__c =: shipmentID ORDER By Name LIMIT 1]);
        List<clofor_com_cfs__AnkenMeisai__c> bills = [SELECT clofor_com_cfs__Seikyusaki__c
                                        FROM clofor_com_cfs__AnkenMeisai__c
                                        WHERE clofor_com_cfs__Anken__c =: shipmentID
                                        ORDER By Name LIMIT 1];
        for(clofor_com_cfs__AnkenMeisai__c bill : bills){
            temp = bill.clofor_com_cfs__Seikyusaki__c;
        }
        List<clofor_com_cfs__AnkenMeisai__c> bills2 = [SELECT clofor_com_cfs__Seikyusaki__c
                                        FROM clofor_com_cfs__AnkenMeisai__c
                                        WHERE clofor_com_cfs__Anken__c =: shipmentID AND clofor_com_cfs__Seikyusaki__c =: shipID
                                        ORDER By Name LIMIT 1];
        for(clofor_com_cfs__AnkenMeisai__c bill2 : bills2){
            temp2 = bill2.clofor_com_cfs__Seikyusaki__c;
        }
        
        if(shipID == null){
            shipID = temp;
            if(temp == null){
                shipID = '';
            }
        }else
        {
            shipID =  temp2;
        }

        clofor_com_cfs__Site_Custom_Settings__c customSettings = [
            SELECT clofor_com_cfs__FCY_Currency__c,
            clofor_com_cfs__Local_Currency__c
            FROM clofor_com_cfs__Site_Custom_Settings__c limit 1];


        foreignCur = customSettings.clofor_com_cfs__FCY_Currency__c;
        localCur = customSettings.clofor_com_cfs__Local_Currency__c;
        TotalAmountSellLocal10 = 0;
        TotalAmountSellLocal8 = 0;
        AmountOfTaxSellLocal10 = 0;
        AmountOfTaxSellLocal8 = 0;
        AmountSellIncl10 = 0;
        AmountSellIncl8 = 0;
        Amount = 0;
        TotalAmount18 = 0;
        TotalTax18 = 0;
        strQuery = stringQueryShipment(shipmentID);
        strQueryBill = stringQueryBill(shipmentID);
        strQueryBilling = stringQueryBilling(shipmentID);
        strQueryBill2 = stringQueryBill2(customerValue,InvoiceValue);
        String strQueryBilling2 = stringQueryBilling2(customerValue,InvoiceValue);
        System.debug('strQueryBilling2 :'+strQueryBilling2);
        strQueryBill3 = stringQueryBill3(customerValue, shipmentID);
        lstbill = Database.query(strQueryBill);
        // String strSelect = 'SELECT clofor_com_cfs__OutboundVATInvNo__c ' ;
        // String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        // String strWhere = ' WHERE clofor_com_cfs__OutboundVATInvNo__c != null';
        // String data =  strSelect + strFrom + strWhere;
        // List<clofor_com_cfs__AnkenMeisai__c> item = new List<clofor_com_cfs__AnkenMeisai__c>();
        // item = Database.query(data);
        // System.debug('item :'+item);
        // for(clofor_com_cfs__AnkenMeisai__c e : item){
            
        //     e.clofor_com_cfs__OutboundVATInvNo__c = null;
            
        // }
        // if( !item.isEmpty() ) {
        //     update item;
        // }
        
        shipment = Database.query(strQuery);
        if(formno != null || formno != '' || formno != 'none'){
            billing = Database.query(strQueryBilling2);
        }
        billing2 = Database.query(stringQueryBilling3(customerValue, InvoiceValue));
        
        Integer a = 0;
        
        
        arrResult = getDataBill(strQueryBill);
        if (arrResult.size()<10){
            a = 10-arrResult.size();
            
        }
        for(Integer i = 0; i<=a;i++){
            ResultWrapper arr = new ResultWrapper();
            arrResult3.add(arr);
        }
        System.debug('Thong debug :'+arrResult3);

        arrResult2 = getDataBill2(strQueryBill2);
        arrResult4 = getDataBill2(strQueryBill3);
        //arrResult1 = getDataShipment();
        for(ResultWrapper2 outbound : arrResult4){
            if(outbound.OutboundInvoiceNo2 != null){
                listOubound.add(outbound.OutboundInvoiceNo2);
            }
        }
        listOubound2.addAll(listOubound);
        System.debug('listOubound :'+listOubound);
        System.debug('listOubound2 :'+listOubound2);
        
        language = 'en';
        docType = 'debit';
        currencyType = 'Both';
        bankType = 'local1';
        templateType = 'official';
        fileType = 'pdf';
        InvoiceNo = '';
        
        strQueryCustomer = '';
        InvoiceNo = getDataShipment();
        System.debug('gggggg :'+InvoiceNo);
        // requiredAttachmentCreation = true;
       
        

        if(ApexPages.currentPage().getParameters().get('showContainer') != null){
            showContainer = Boolean.valueOf(ApexPages.currentPage().getParameters().get('showContainer'));
        }
        if(ApexPages.currentPage().getParameters().get('showSignature') != null){
            showSignature = Boolean.valueOf(ApexPages.currentPage().getParameters().get('showSignature'));
        }
        if(ApexPages.currentPage().getParameters().get('requiredAttachmentCreation') != null){
            requiredAttachmentCreation = Boolean.valueOf(ApexPages.currentPage().getParameters().get('requiredAttachmentCreation'));
        }
        ouboundValue = String.valueOf(ApexPages.currentPage().getParameters().get('ouboundValue'));

        System.debug('ouboundValue :'+ouboundValue);
        // if(showContainer == null){
        //     showContainer =false;
        // }
        String filename =shipment.Name +'_請求書_'+ shipment.clofor_com_cfs__HBL_Number_SEA_AIR__c +'.pdf';
        Apexpages.currentPage().getHeaders().put('Content-Type', 'text/html; charset="UTF-8"');

        Apexpages.currentPage().getHeaders().put('content-disposition', 'inline; filename=\"'+EncodingUtil.urlEncode(filename,'utf-8'));
        // EncodingUtil.urlEncode(filename,'uft-8');

        System.debug('show debug :'+requiredAttachmentCreation);
        Set<String> languagesAvailable = new Set<String>{'en','vi','ko','ja','zh'};
        for(String la : languagesAvailable){
            if(UserInfo.getLanguage().contains(la)){
                language = la;
            }
        }
        List<clofor_com_cfs__AnkenMeisai__c> lstBill = new List<clofor_com_cfs__AnkenMeisai__c>();
        lstBill = Database.query(strQueryBill);
        Integer count = 1;
        For (clofor_com_cfs__AnkenMeisai__c bill: lstBill){
            count++;
        }
        rowcount = 16-count;
        
        if(shipment.RecordType.Name =='Ocean Export' || shipment.RecordType.Name == 'Ocean Import'){
            reportType = 'sea';
        }
        if(shipment.RecordType.Name == 'Air Export' || shipment.RecordType.Name == 'Air Import'){
            reportType = 'air';
        }


        
        if(shipment.RecordType.Name =='Ocean Export' ||shipment.RecordType.Name == 'Air Export'){
            reportType = 'export';
        }
        if(shipment.RecordType.Name == 'Ocean Import' || shipment.RecordType.Name == 'Air Import'){
            reportType = 'import';
        }

        String customerIdSelect = ApexPages.currentPage().getParameters().get('customerId');
        System.debug('customerIdSelect :'+customerIdSelect);
        List<clofor_com_cfs__AnkenMeisai__c> bills9 = [SELECT Id, clofor_com_cfs__Seikyusaki__c, clofor_com_cfs__Seikyusaki__r.Name, clofor_com_cfs__PaymentTo__c, clofor_com_cfs__PaymentTo__r.Name,clofor_com_cfs__Seikyusaki__r.CompanyNoJapan__c 
                                        FROM clofor_com_cfs__AnkenMeisai__c
                                        WHERE clofor_com_cfs__Anken__c =: shipmentID AND clofor_com_cfs__Seikyusaki__c =:customerIdSelect
                                        ORDER BY Name LIMIT 1];

        for(clofor_com_cfs__AnkenMeisai__c bill: bills9){
            If(!String.isBlank(bill.clofor_com_cfs__Seikyusaki__c)){
                IdCustomFirst = bill.clofor_com_cfs__Seikyusaki__c;
                customerId = bill.clofor_com_cfs__Seikyusaki__r.Name;
                companyjapan = bill.clofor_com_cfs__Seikyusaki__r.CompanyNoJapan__c;
                System.debug('thong debugggg :'+companyjapan);
                System.debug('Idfirst:'+ IdCustomFirst);
                System.debug('customer:'+ customerId);
                break;
            }
        }

        
}

    

    public PageReference saveOnchangeApex(){
        
        // shipmentID = ApexPages.currentPage().getParameters().get('id');
        // shipID = ApexPages.currentPage().getParameters().get('Seikyusaki');
        // System.debug('llllllll :'+shipID);
        // if(shipID == null){
        //     shipID = '0011s00001YXUPDAA5';
        // }
        // System.debug('debugggg :'+shipID);
        // String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        // String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        // String strWhere = 'WHERE clofor_com_cfs__Seikyusaki__c = \'' + shipID + '\' AND clofor_com_cfs__Anken__c = \'' + shipmentID + '\'' ;
 
        // String strOrderBy = ' ORDER BY Name';
        // String query = strSelect + strFrom + strWhere +strOrderBy;  
        
        // List<ResultWrapper2> results = new List<ResultWrapper2>();
        // List<clofor_com_cfs__AnkenMeisai__c> lstBill = new List<clofor_com_cfs__AnkenMeisai__c>();
        // lstBill = Database.query(query);
        // System.debug('deeeeee :'+lstBill);
        // Integer count = 1;
        // For (clofor_com_cfs__AnkenMeisai__c bill: lstBill){
           
        //     ResultWrapper2 item = new ResultWrapper2();
        //     item.Index2 = count;
        //     item.ServiceName2 = bill.clofor_com_cfs__InsatuyouSyohin__c;
        //     item.ChargeUnit2 = bill.clofor_com_cfs__ChargeUnitInPrint__c;
        //     item.Curr2 = bill.clofor_com_cfs__curr__c;
        //     item.TaxInitial2 = bill.clofor_com_cfs__TaxInitial__c;
        //     item.SellInTaxAmount2 = bill.clofor_com_cfs__SellInTaxAmountJPY__c;
           
        //     count++;
            
        //     results.add(item);
            
            
        // }  
       
        
        return null;
        
    }


    public void test(){
        if(showContainer = true){
            showSignature = true;
        }
 
    }

    public void generateAttachmentFile(){
        System.debug('loggg :');
        if(ApexPages.currentPage().getParameters().get('requiredAttachmentCreation') != null){
            requiredAttachmentCreation = Boolean.valueOf(ApexPages.currentPage().getParameters().get('requiredAttachmentCreation'));
        }

        System.debug('loggg :'+requiredAttachmentCreation);
        PageReference pdf_file =Page.page_InvoiceForm;
        pdf_file.getParameters().put('Id', shipmentID);
        pdf_file.getParameters().put('showContainer', 'false');
        pdf_file.getParameters().put('showSignature', 'false');
        pdf_file.getParameters().put('requiredAttachmentCreation', 'false');
        pdf_file.getParameters().put('customerId', customerId);
        
        clofor_com_cfs__CustomObject1__c item = new clofor_com_cfs__CustomObject1__c();
        String strSelect = 'SELECT ' + String.join(new List<String>(setFields), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
        String strWhere = 'WHERE Id = \'' + shipmentId + '\'' ;
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        String data = strSelect + strFrom + strWhere + strOrderBy;
        item = Database.query(data);
        String namefile =item.Name +'_請求書_'+ item.clofor_com_cfs__HBL_Number_SEA_AIR__c+'_v' ;

       
        String attachName = namefile ;
        String attachNameSearch = attachName + '%';
        // get exist file Name
        List<Attachment> attachments = [SELECT Id, Name, ParentId 
                                        FROM Attachment 
                                        WHERE ParentId =: shipmentID 
                                        AND Name LIKE : attachNameSearch 
                                        ORDER BY CreatedDate DESC LIMIT 1];
                                        
        if(attachments.isEmpty()){
            attachName += '1.1';
        }else{
            String attachNameExist = attachments[0].Name;
            attachNameExist = attachNameExist.substringAfter(attachName);
            attachNameExist = attachNameExist.substringBefore('.pdf');
            Decimal versionNumber = Decimal.valueOf(attachNameExist);
            versionNumber += 0.1;
            attachName += String.valueOf(versionNumber);
        }
        if(requiredAttachmentCreation != false){
            Attachment attach = new Attachment();
            Blob body;
            attach.Name = attachName + '.pdf'; 
            attach.IsPrivate = false;
            attach.ParentId = shipmentID;
            if(!Test.isRunningTest()){
            body = pdf_file.getContentAsPDF();
            System.debug('debuggg Thong :'+body);
            attach.Body = body;
            FlsService.doInsert(attach);
        }
        }
        
        
    }
    public PageReference saveApex(){
        String invoiceno = ApexPages.currentPage().getParameters().get('invoiceno');
        System.debug('invoiceno :'+invoiceno);
        String customerValue = ApexPages.currentPage().getParameters().get('customerValue');
        System.debug('customerValue :'+customerValue);
        String billIds = ApexPages.currentPage().getParameters().get('billIds');
        
        String shipID = ApexPages.currentPage().getParameters().get('id');

        

        
   
        List<String> lstBillIds = new List<String>();
        if(!String.isBlank(billIds)){
            lstBillIds = billIds.split(',');
            
        }
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere;
        if(InvoiceValue != null && customerValue == 'none'){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__OutboundVATInvNo__c = \'' + InvoiceValue + '\'';
        }
        if(InvoiceValue != null && customerValue != null){
            strWhere = 'WHERE clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__OutboundVATInvNo__c = \'' + InvoiceValue + '\''; 
        }
        if(InvoiceValue == null || InvoiceValue == '' && customerValue != null){
            strWhere = 'WHERE clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        if(InvoiceValue == 'none' && customerValue != null){
            strWhere = 'WHERE clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        if(InvoiceValue != null && customerValue == null){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__OutboundVATInvNo__c = \'' + InvoiceValue + '\'';
        }
        if(InvoiceValue == null && customerValue == null){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        if(InvoiceValue == null && customerValue == 'none'){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        
        if(InvoiceValue == 'none' && customerValue == 'none'){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        String strOrderBy = ' ORDER BY Name';
        String query = strSelect + strFrom + strWhere +strOrderBy;  
        List<clofor_com_cfs__AnkenMeisai__c> lstBill = Database.query(query);
        for (clofor_com_cfs__AnkenMeisai__c bill : lstBill){
            // if (invoiceno != ''){
            //     bill.clofor_com_cfs__OutboundVATInvNo__c = invoiceno;
            // }
            bill.clofor_com_cfs__OutboundVATInvNo__c = invoiceno;
        }
        System.debug('ThongDebug :'+lstBill);
        update lstBill;
        
        return null;
    }


    private List<ResultWrapper> getDataBill(String strQueryy){
        List<ResultWrapper> results = new List<ResultWrapper>();
        List<clofor_com_cfs__AnkenMeisai__c> lstBill = new List<clofor_com_cfs__AnkenMeisai__c>();
        lstBill = Database.query(strQueryy);
        
        Integer count = 1;
        For (clofor_com_cfs__AnkenMeisai__c bill: lstBill){
           
            ResultWrapper item = new ResultWrapper();
            item.Index = count;
            item.ServiceName = bill.clofor_com_cfs__InsatuyouSyohin__c;
            item.ChargeUnit = bill.clofor_com_cfs__ChargeUnitInPrint__c;
            item.Curr = bill.clofor_com_cfs__curr__c;
            item.TaxInitial = bill.clofor_com_cfs__TaxInitial__c;
            item.SellInTaxAmount = bill.clofor_com_cfs__SellInTaxAmountJPY__c;
            item.SellTankaJPY = bill.clofor_com_cfs__SellTankaJPY__c;
            item.SellTankaUSD = bill.clofor_com_cfs__SellTankaUSD__c;
            item.SellAmountJPN =bill.clofor_com_cfs__SellAmountJPN__c;
            item.Quantity = bill.clofor_com_cfs__Suryo__c;
            if(bill.clofor_com_cfs__TaxInitial__c != null){
                if(bill.clofor_com_cfs__TaxInitial__c == 10.00){
                    TotalAmountSellLocal10 += bill.clofor_com_cfs__SellAmountJPN__c;
                    AmountOfTaxSellLocal10 += bill.clofor_com_cfs__SellTaxNum__c;
                    AmountSellIncl10 += bill.clofor_com_cfs__SellInTaxAmountJPY__c;
                }
                
            }
            if(bill.clofor_com_cfs__TaxInitial__c != null){
                if(bill.clofor_com_cfs__TaxInitial__c == 8.00){
                    TotalAmountSellLocal8 += bill.clofor_com_cfs__SellAmountJPN__c;
                    AmountOfTaxSellLocal8 += bill.clofor_com_cfs__SellTaxNum__c;
                    AmountSellIncl8 += bill.clofor_com_cfs__SellInTaxAmountJPY__c;
                }
                
            }
            if(bill.clofor_com_cfs__SellInTaxAmountJPY__c != null){
                Amount += bill.clofor_com_cfs__SellInTaxAmountJPY__c;
            }
            
            // TotalAmount18 = TotalAmountSellLocal10 + TotalAmountSellLocal8;
            if(bill.clofor_com_cfs__SellAmountJPN__c != null){
                TotalAmount18 += bill.clofor_com_cfs__SellAmountJPN__c;
            }
            TotalTax18 = AmountOfTaxSellLocal10 + AmountOfTaxSellLocal8;
            
            count++;
            
            results.add(item);
            
      
        }  
        System.debug('ccccccccc :'+results);
        return results;
        
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
            item.OutboundInvoiceNo2 = bill.clofor_com_cfs__OutboundVATInvNo__c;

            count++;
            
            results.add(item);
            
      
        }  
        System.debug('kkkkkk :'+count);
        return results;
        
    }

    // public void test(){
    //     if(showContainer = true){
    //         showSignature = true;
    //     }

    // }

    private String getDataShipment(){
        clofor_com_cfs__CustomObject1__c item = new clofor_com_cfs__CustomObject1__c();
        String strSelect = 'SELECT ' + String.join(new List<String>(setFields), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
        String strWhere = 'WHERE Id = \'' + shipmentId + '\'' ;
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        String data = strSelect + strFrom + strWhere + strOrderBy;
        item = Database.query(data);

        List<clofor_com_cfs__AnkenMeisai__c> bill = new List<clofor_com_cfs__AnkenMeisai__c>();
        String strSelect2 = 'SELECT Id, Name,clofor_com_cfs__OutboundVATInvNo__c';
        String strFrom2 = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere2 = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\'' ;
        String strOrderBy2 = ' ORDER BY Name';
        String data2 = strSelect2 + strFrom2 + strWhere2 + strOrderBy2;
        bill = Database.query(data2);
        System.debug('billlll :'+bill);
        List<Decimal> billDecimal = new List<Decimal>();
        String test123 = '';
            for(clofor_com_cfs__AnkenMeisai__c e : bill){
                // billDecimal.add(Decimal.valueOf(e.clofor_com_cfs__OutboundVATInvNo__c.substringAfter('-')));
                if(e.clofor_com_cfs__OutboundVATInvNo__c != null){
                    billDecimal.add(Decimal.valueOf(e.clofor_com_cfs__OutboundVATInvNo__c.substringAfter('-')));
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
        String invoiceoutbound = 'FM'+item.Name+'-'+ maxvaluemax;
        System.debug('invoiceoutbound :'+invoiceoutbound.substringAfter('-'));
        return invoiceoutbound;
    }

    public PageReference closePopupDialog() {
        PageReference page = new PageReference('/'+shipmentID);
        page.setRedirect(true);
        return page;
    }

    

    
    
    
    public void refreshCustomerOption(){

    }

    

    public List<SelectOption> getCustomerList(){
        
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('none', '-- select -- '));
        List<clofor_com_cfs__AnkenMeisai__c> bills = [SELECT Id, clofor_com_cfs__Seikyusaki__c, clofor_com_cfs__Seikyusaki__r.Name, clofor_com_cfs__PaymentTo__c, clofor_com_cfs__PaymentTo__r.Name 
                                        FROM clofor_com_cfs__AnkenMeisai__c
                                        WHERE clofor_com_cfs__Anken__c =: shipmentID
                                        ORDER BY Name];
        Set<Id> customerIds = new Set<Id>();

        for(clofor_com_cfs__AnkenMeisai__c bill: bills){
            If(!String.isBlank(bill.clofor_com_cfs__Seikyusaki__c)){
                // IdCustomFirst = bill.clofor_com_cfs__Seikyusaki__c;
                customerId = bill.clofor_com_cfs__Seikyusaki__r.Name;
                if(!String.isBlank(customerValue)){
                    customerId = customerValue;      
                }

               
            }
        }

         for(clofor_com_cfs__AnkenMeisai__c bill: bills){

                 if(!String.isBlank(bill.clofor_com_cfs__Seikyusaki__c) && !customerIds.contains(bill.clofor_com_cfs__Seikyusaki__c)){
                    options.add(new SelectOption(bill.clofor_com_cfs__Seikyusaki__c, bill.clofor_com_cfs__Seikyusaki__r.Name));
                    
                 }
                 customerIds.add(bill.clofor_com_cfs__Seikyusaki__c);
         }
        System.debug('Debugggg :'+customerIds);
        return options;
    }
    public List<SelectOption> getFileTypeOptions(){

        List<SelectOption> fileTypes = new List<SelectOption>();
        fileTypes.add(new SelectOption('pdf', 'PDF'));
        fileTypes.add(new SelectOption('excel', 'Excel'));
        return fileTypes;
    }
    public List<SelectOption> getOuboundList(){
        List<clofor_com_cfs__AnkenMeisai__c> bills = [SELECT Id, clofor_com_cfs__OutboundVATInvNo__c 
        FROM clofor_com_cfs__AnkenMeisai__c
        WHERE clofor_com_cfs__Anken__c =: shipmentID
        ORDER BY Name];
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('none', '-- None -- '));

        Set<Id> ouboundIds = new Set<Id>();

        for(clofor_com_cfs__AnkenMeisai__c bill: bills){
            if(!String.isBlank(bill.clofor_com_cfs__OutboundVATInvNo__c)){
                if(!String.isBlank(InvoiceValue)){
                    ouboundId = InvoiceValue;      
                }  
            }
        }
         for(String outbound : listOubound2){
            
                options.add(new SelectOption(outbound,outbound)); 
          
            // ouboundIds.add(outbound);
        }

        return options;
    }
    
    // private String stringQueryCustomer(){
    //     String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
    //     String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
    //     String strWhere = 'WHERE clofor_com_cfs__Seikyusaki__c = \'' + customerId + '\'';
    //     String strOrderBy = ' ORDER BY Name LIMIT 1';
     
    //     return strSelect + strFrom + strWhere + strOrderBy;
    // }

    private String stringQueryShipment(String shipmentId){
        String strSelect = 'SELECT RecordType.Name,' + String.join(new List<String>(setFields), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
        String strWhere = 'WHERE Id = \'' + shipmentId + '\'' ;
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        return strSelect + strFrom + strWhere + strOrderBy;
    }

    private String stringQueryBill(String shipmentId){
         String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
         String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
         String strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\'';
         String strOrderBy = ' ORDER BY clofor_com_cfs__SeikyuBangou__c ';
         return strSelect + strFrom + strWhere + strOrderBy; 
     }
     private String stringQueryBilling(String shipmentId){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        return strSelect + strFrom + strWhere + strOrderBy; 
    }
    private String stringQueryBill2(String customerValue, String InvoiceValue){
        shipmentID = ApexPages.currentPage().getParameters().get('id');
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere;
        if(InvoiceValue != null && customerValue != null){
            strWhere = 'WHERE clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__OutboundVATInvNo__c = \'' + InvoiceValue + '\''; 
        }
        if(InvoiceValue == null || InvoiceValue == '' && customerValue != null){
            strWhere = 'WHERE clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        if(InvoiceValue == 'none' && customerValue != null){
            strWhere = 'WHERE clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        if(InvoiceValue != null && customerValue == null){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__OutboundVATInvNo__c = \'' + InvoiceValue + '\'';
        }
        if(InvoiceValue == null && customerValue == null){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        if(InvoiceValue == null && customerValue == 'none'){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        if(InvoiceValue != null && customerValue == 'none'){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__OutboundVATInvNo__c = \'' + InvoiceValue + '\'';
        }
        if(InvoiceValue == 'none' && customerValue == 'none'){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        String strOrderBy = ' ORDER BY clofor_com_cfs__SeikyuBangou__c';
        return strSelect + strFrom + strWhere + strOrderBy; 
    }
    private String stringQueryBilling3(String customerValue, String InvoiceValue){
        shipmentID = ApexPages.currentPage().getParameters().get('id');
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere;
        if(InvoiceValue != null && customerValue != null){
            strWhere = 'WHERE clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__OutboundVATInvNo__c = \'' + InvoiceValue + '\''; 
        }
        if(InvoiceValue == null || InvoiceValue == '' && customerValue != null){
            strWhere = 'WHERE clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        if(InvoiceValue == 'none' && customerValue != null){
            strWhere = 'WHERE clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__Anken__c = \'' + shipmentId + '\'';
        }
        if(InvoiceValue != null && customerValue == null){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__OutboundVATInvNo__c = \'' + InvoiceValue + '\'';
        }
        if(InvoiceValue == null && customerValue == null){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        if(InvoiceValue == null && customerValue == 'none'){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        if(InvoiceValue != null && customerValue == 'none'){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__OutboundVATInvNo__c = \'' + InvoiceValue + '\'';
        }
        if(InvoiceValue == 'none' && customerValue == 'none'){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\'';
        }
        String strOrderBy = ' ORDER BY clofor_com_cfs__SeikyuBangou__c LIMIT 1';
        return strSelect + strFrom + strWhere + strOrderBy; 
    }
    private String stringQueryBilling2(String customerValue, String InvoiceValue){
        shipmentID = ApexPages.currentPage().getParameters().get('id');
        
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere;
        if(invoiceno != null && customerValue != null){
            strWhere = 'WHERE clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__OutboundVATInvNo__c = \'' + invoiceno + '\''; 
        }
        if(invoiceno == null || invoiceno == 'none' && customerValue != null){
            strWhere = 'WHERE clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        if(invoiceno == null || invoiceno == 'none' && customerValue != null){
            strWhere = 'WHERE clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\' AND clofor_com_cfs__Anken__c = \'' + shipmentId + '\'';
        }
        if(invoiceno != null && customerValue == null){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true AND clofor_com_cfs__OutboundVATInvNo__c = \'' + invoiceno + '\'';
        }
        if(invoiceno == null && customerValue == null){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        if(invoiceno == null && customerValue == 'none'){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true';
        }
        if(invoiceno != null && customerValue == 'none'){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__PrintFlag__c = true AND clofor_com_cfs__OutboundVATInvNo__c = \'' + invoiceno + '\'';
        }
        String strOrderBy = ' ORDER BY clofor_com_cfs__SeikyuBangou__c LIMIT 1';
        return strSelect + strFrom + strWhere + strOrderBy; 
    }
    private String stringQueryBill3(String customerValue, String shipmentId){
        shipmentID = ApexPages.currentPage().getParameters().get('id');
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsBill), ',');
        String strFrom = ' FROM clofor_com_cfs__AnkenMeisai__c ';
        String strWhere ;
        if(customerValue != null){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\'';
        }
        if(customerValue != 'none'){
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\' AND clofor_com_cfs__Seikyusaki__c = \'' + customerValue + '\'';
        }
        if(customerValue == 'none') {
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\'';
        }
        if(customerValue == null) {
            strWhere = 'WHERE clofor_com_cfs__Anken__c = \'' + shipmentId + '\'';
        }
        String strOrderBy = ' ORDER BY clofor_com_cfs__SeikyuBangou__c';
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
        public Decimal SellTankaJPY {get; set;}
        public Decimal SellTankaUSD {get; set;}
        public Decimal SellAmountJPN {get; set;}
        public Decimal Quantity {get; set;}
        public ResultWrapper(){
            this.bill = new clofor_com_cfs__AnkenMeisai__c();
            this.Index = 0;
            this.ServiceName = '';
            this.ChargeUnit = '';
            this.Curr = '';
            this.TaxInitial = 0;
            this.SellInTaxAmount = 0;
            this.OutboundInvoiceNo = '';
            SellTankaUSD = 0;
            SellTankaJPY = 0;
            SellAmountJPN = 0;
            Quantity = 0;
        }
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
        public String OutboundInvoiceNo2 {get;set;}
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
            this.OutboundInvoiceNo2 = '';
        }
    }
}