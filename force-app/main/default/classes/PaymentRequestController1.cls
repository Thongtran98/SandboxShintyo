public with sharing class PaymentRequestController1 {
    public clofor_com_cfs__PaymentRequest__c payment {get;set;}
    public List<clofor_com_cfs__FMSBillPayReq__c> lstPlan {get;set;}
    public List<clofor_com_cfs__FMSBillPayReq__c> lstPlanBill {get;set;}
    public clofor_com_cfs__BankAccount__c bankAcc {get;set;}
    List<AggregateResult> lstOutbound {get; set;}
    List<String> lstOutbound2 {get; set;}
    public Boolean showSignature{get; set;}
    public Boolean requiredAttachmentCreation{get; set;}
    public String bankType{get;set;}
    public String paymentId{get;set;}
    public Date printDate {get; set;}
    public String strQuery {get; set;}
    public String strQueryPlan {get; set;}
    public String customerId{get;set;}
    public String bankId{get;set;}
    public List<ResultWrapper> arrResult {get; set;}
    private static Set<String> setFields = new Set<String>();
    private static Set<String> setFieldsPlan = new Set<String>();

    static{
        setFields.add('Name');
        setFields.add('clofor_com_cfs__PaymentTo__c');
        setFields.add('clofor_com_cfs__PaymentTo__r.Name');
        setFields.add('clofor_com_cfs__PaymentTo__r.CompanyNoJapan__c');
        setFields.add('clofor_com_cfs__AmountLocal__c');
        setFields.add('clofor_com_cfs__PaymentDueDate__c');
        setFields.add('CreatedBy.Name');
        setFields.add('CreatedDate');
        setFields.add('LastModifiedDate');
        setFields.add('clofor_com_cfs__RollupFMSUnreceivedBalOfSellLocal__c');
    }
    static{
        setFieldsPlan.add('clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Anken__r.clofor_com_cfs__REFNO__c');
        setFieldsPlan.add('clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Anken__r.RecordType.Name');
        setFieldsPlan.add('clofor_com_cfs__FMSBillID__r.clofor_com_cfs__OutboundVATInvNo__c');
        // setFieldsPlan.add('clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Anken__r.clofor_com_cfs__POL__c');
        // setFieldsPlan.add('clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Anken__r.clofor_com_cfs__POD__c');
        setFieldsPlan.add('clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Anken__r.clofor_com_cfs__ETD__c');
        setFieldsPlan.add('clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Anken__r.clofor_com_cfs__ETA__c');
        // setFieldsPlan.add('clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Anken__r.clofor_com_cfs__HBL_Number_SEA_AIR__c');
        setFieldsPlan.add('clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Anken__r.clofor_com_cfs__HAWB__c');
        setFieldsPlan.add('clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Anken__r.clofor_com_cfs__HBL__c');
    }
    public PaymentRequestController1() {
        payment = new clofor_com_cfs__PaymentRequest__c();
        bankAcc = new clofor_com_cfs__BankAccount__c();
        paymentId = ApexPages.currentPage().getParameters().get('id');

        arrResult = new List<ResultWrapper>();
        bankType = 'local1';
        strQuery = '';
        strQueryPlan = '';
        bankId = '';
        bankId = ApexPages.currentPage().getParameters().get('customerId');
        System.debug('bankId :'+bankId);
        lstPlanBill = new List<clofor_com_cfs__FMSBillPayReq__c>();
        lstOutbound = new List<AggregateResult>();
        lstOutbound2 = new List<String>();
        printDate = System.today();
        strQuery = stringQueryPayment(paymentId);
        
        payment = Database.query(strQuery);
        String BillId = payment.clofor_com_cfs__PaymentTo__c;
        strQueryPlan = stringQueryPlanBill(paymentId,BillId);
        System.debug('strQueryPlan :'+strQueryPlan);
        lstOutbound = Database.query(strQueryPlan);
        System.debug('lstOutbound :'+lstOutbound);
        if(bankId != null){
            bankAcc = Database.query(stringQueryBank(bankId));
        }
        arrResult = getDataBill(strQueryPlan);
        System.debug('arrResult :'+arrResult);
        if(ApexPages.currentPage().getParameters().get('showSignature') != null){
            showSignature = Boolean.valueOf(ApexPages.currentPage().getParameters().get('showSignature'));
        }
        if(ApexPages.currentPage().getParameters().get('requiredAttachmentCreation') != null){
            requiredAttachmentCreation = Boolean.valueOf(ApexPages.currentPage().getParameters().get('requiredAttachmentCreation'));
        }

        String test = payment.RecordType.Name;
        System.debug('test :'+test);
        // String strSelect = 'SELECT clofor_com_cfs__FMSBillID__r.clofor_com_cfs__OutboundVATInvNo__c';
        // String strFrom = ' FROM clofor_com_cfs__FMSBillPayReq__c  ';
        // String strWhere = 'WHERE clofor_com_cfs__PaymentRequestID__c = \'' + paymentId + '\'' ;
        // String strOrderBy = ' Group By clofor_com_cfs__FMSBillID__r.clofor_com_cfs__OutboundVATInvNo__c';
        // String data = strSelect + strFrom + strWhere + strOrderBy;
        // lstOutbound = Database.query(data);
        // System.debug('lstOutbound :'+lstOutbound);

        // for(AggregateResult out : lstOutbound){
        //     lstOutbound2.add(String.valueOf(out.get('clofor_com_cfs__OutboundVATInvNo__c')));
        // }
        // System.debug('lstOutbound2 :'+lstOutbound2);
        List<clofor_com_cfs__BankAccount__c> billbanks = [SELECT Id, clofor_com_cfs__Account__c, clofor_com_cfs__Account__r.Name,
        clofor_com_cfs__BankOfficialName__c, clofor_com_cfs__BankAccountNumber__c ,clofor_com_cfs__BankAccountCurrency__c
                                        FROM clofor_com_cfs__BankAccount__c
                                        WHERE InternalBankAccount__c = true
                                        ORDER BY Name LIMIT 1];

        for(clofor_com_cfs__BankAccount__c bank : billbanks){
            if(!String.isBlank(bank.clofor_com_cfs__Account__c)){
                // IdCustomFirst = bill.clofor_com_cfs__Account__c;
                customerId = bank.Id;
                
                break;
            }
        }
        
    }

    private List<ResultWrapper> getDataBill(String strQueryy){
        List<ResultWrapper> results = new List<ResultWrapper>();
        List<AggregateResult> lstPlan = new List<AggregateResult>();
        lstPlan = Database.query(strQueryy);
        
        Integer count = 1;
        for (AggregateResult plan: lstPlan){
           
            ResultWrapper item = new ResultWrapper();
            item.Index = count;
            item.RefNo  = (String)plan.get('clofor_com_cfs__REFNO__c');
            item.RecordTypeShipment  = (String)plan.get('Name');
            item.InvoiceNo  = (String)plan.get('clofor_com_cfs__OutboundVATInvNo__c');
            item.POL = (String)plan.get('POL');
            item.ETD = (Date)plan.get('clofor_com_cfs__ETD__c');
            item.POD = (String)plan.get('POD');
            item.ETA =(Date)plan.get('clofor_com_cfs__ETA__c');
            // item.HouseBL =plan.clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Anken__r.clofor_com_cfs__HBL_Number_SEA_AIR__c;
            item.AmountPlan = (Decimal)plan.get('expr0');
            String hbl = (String)plan.get('clofor_com_cfs__HBL__c');
            if(hbl == null || hbl == ''){
                item.HouseBL = (String)plan.get('clofor_com_cfs__HAWB__c');
            }else{
                item.HouseBL = (String)plan.get('clofor_com_cfs__HBL__c');
            }
            count++;
            
            results.add(item);
            
      
        }  
        System.debug('ccccccccc :'+results);
        return results;
        
    }
    public List<SelectOption> getCustomerList(){
        
        List<SelectOption> options = new List<SelectOption>();
        List<clofor_com_cfs__BankAccount__c> billbanks = [SELECT Id, clofor_com_cfs__Account__c, clofor_com_cfs__Account__r.Name,
        clofor_com_cfs__BankOfficialName__c, clofor_com_cfs__BankAccountNumber__c ,clofor_com_cfs__BankAccountCurrency__c
                                        FROM clofor_com_cfs__BankAccount__c
                                        WHERE InternalBankAccount__c = true
                                        ORDER BY Name];
        // Bank Acc JPY
        List<clofor_com_cfs__BankAccount__c> bills = [SELECT Id, clofor_com_cfs__Account__c, clofor_com_cfs__Account__r.Name,
        clofor_com_cfs__BankOfficialName__c, clofor_com_cfs__BankAccountNumber__c ,clofor_com_cfs__BankAccountCurrency__c
                                        FROM clofor_com_cfs__BankAccount__c
                                        WHERE InternalBankAccount__c = true AND clofor_com_cfs__BankAccountCurrency__c = 'JPY'
                                        ORDER BY Name];

        // Bank Acc FCY
        List<clofor_com_cfs__BankAccount__c> bills2 = [SELECT Id, clofor_com_cfs__Account__c, clofor_com_cfs__Account__r.Name,
        clofor_com_cfs__BankOfficialName__c, clofor_com_cfs__BankAccountNumber__c ,clofor_com_cfs__BankAccountCurrency__c
                                        FROM clofor_com_cfs__BankAccount__c
                                        WHERE InternalBankAccount__c = true AND clofor_com_cfs__BankAccountCurrency__c = 'USD'
                                        ORDER BY Name];
        Set<Id> customerIds = new Set<Id>();
                            
        // for(clofor_com_cfs__BankAccount__c bank: bills){
        //     if(!String.isBlank(bank.clofor_com_cfs__Account__c)){
        //         customerId = bank.clofor_com_cfs__BankOfficialName__c + ' - ' + bank.clofor_com_cfs__BankAccountNumber__c + ' - ' + bank.clofor_com_cfs__BankAccountCurrency__c;
        //     }else{
        //         customerId = '';
        //     }
        // }

        // for(clofor_com_cfs__BankAccount__c bank: billbankss){
        //     if(!String.isBlank(bank.clofor_com_cfs__Account__c)){
        //         // IdCustomFirst = bill.clofor_com_cfs__Seikyusaki__c;
        //         customerId = bank.clofor_com_cfs__Account__c;
        //         if(!String.isBlank(bankId)){
        //             customerId = bankId;      
        //         }

        //         break;
        //     }
        // }
        if(payment.RecordType.Name == 'Payment Request-USD Currency'){
            for(clofor_com_cfs__BankAccount__c bill: bills2){
                String detail = bill.clofor_com_cfs__BankOfficialName__c + ' - ' + bill.clofor_com_cfs__BankAccountNumber__c + ' - ' + bill.clofor_com_cfs__BankAccountCurrency__c;
                 if(!String.isBlank(bill.clofor_com_cfs__Account__c) && !customerIds.contains(bill.clofor_com_cfs__Account__c)){
                    options.add(new SelectOption(bill.Id, detail));
                 }
                 customerIds.add(bill.Id);
            }
    
            for(clofor_com_cfs__BankAccount__c bill: bills){
                    String detail = bill.clofor_com_cfs__BankOfficialName__c + ' - ' + bill.clofor_com_cfs__BankAccountNumber__c + ' - ' + bill.clofor_com_cfs__BankAccountCurrency__c;
                     if(!String.isBlank(bill.clofor_com_cfs__Account__c) && !customerIds.contains(bill.clofor_com_cfs__Account__c)){
                        options.add(new SelectOption(bill.Id, detail));
                     }
                     customerIds.add(bill.Id);
            }
        }
        if(payment.RecordType.Name == 'Payment Request-Local Currency'){
            for(clofor_com_cfs__BankAccount__c bill: bills){
                String detail = bill.clofor_com_cfs__BankOfficialName__c + ' - ' + bill.clofor_com_cfs__BankAccountNumber__c + ' - ' + bill.clofor_com_cfs__BankAccountCurrency__c;
                 if(!String.isBlank(bill.clofor_com_cfs__Account__c) && !customerIds.contains(bill.clofor_com_cfs__Account__c)){
                    options.add(new SelectOption(bill.Id, detail));
                 }
                 customerIds.add(bill.Id);
            }
            for(clofor_com_cfs__BankAccount__c bill: bills2){
                String detail = bill.clofor_com_cfs__BankOfficialName__c + ' - ' + bill.clofor_com_cfs__BankAccountNumber__c + ' - ' + bill.clofor_com_cfs__BankAccountCurrency__c;
                 if(!String.isBlank(bill.clofor_com_cfs__Account__c) && !customerIds.contains(bill.clofor_com_cfs__Account__c)){
                    options.add(new SelectOption(bill.Id, detail));
                 }
                 customerIds.add(bill.Id);
            }
        }


        System.debug('Debugggg :'+customerIds);
        return options;
    }

    public void generateAttachmentFile(){
        System.debug('loggg :');
        if(ApexPages.currentPage().getParameters().get('requiredAttachmentCreation') != null){
            requiredAttachmentCreation = Boolean.valueOf(ApexPages.currentPage().getParameters().get('requiredAttachmentCreation'));
        }

        System.debug('loggg :'+requiredAttachmentCreation);
        PageReference pdf_file =Page.page_PaymentRequest;
        pdf_file.getParameters().put('Id', paymentId);
        // pdf_file.getParameters().put('showContainer', 'false');
        pdf_file.getParameters().put('showSignature', 'false');
        pdf_file.getParameters().put('requiredAttachmentCreation', 'false');
        pdf_file.getParameters().put('customerId', customerId);
        
        clofor_com_cfs__PaymentRequest__c item = new clofor_com_cfs__PaymentRequest__c();
        String strSelect = 'SELECT ' + String.join(new List<String>(setFields), ',');
        String strFrom = ' FROM clofor_com_cfs__PaymentRequest__c ';
        String strWhere = 'WHERE Id = \'' + paymentId + '\'' ;
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        String data = strSelect + strFrom + strWhere + strOrderBy;
        item = Database.query(data);
        String namefile =item.Name +'_v' ;
        // String namefile = 'S'+item.clofor_com_cfs__WkInitial__c+item.Name+'-'+item.clofor_com_cfs__QuotationVer__c;

        
        // String namefile = 'Invoice_v';
       
        String attachName = namefile ;
        String attachNameSearch = attachName + '%';
        // get exist file Name
        List<Attachment> attachments = [SELECT Id, Name, ParentId 
                                        FROM Attachment 
                                        WHERE ParentId =: paymentId 
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
            attach.ParentId = paymentId;
            if(!Test.isRunningTest()){
            body = pdf_file.getContentAsPDF();
            System.debug('debuggg Thong :'+body);
            attach.Body = body;
            FlsService.doInsert(attach);
        }
        }
        
        
    }

    private String stringQueryPayment(String paymentId){
        String strSelect = 'SELECT RecordType.Name, ' + String.join(new List<String>(setFields), ',');
        String strFrom = ' FROM clofor_com_cfs__PaymentRequest__c ';
        String strWhere = 'WHERE Id = \'' + paymentId + '\'' ;
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
    private String stringQueryPlan(String paymentId){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFieldsPlan), ',');
        String strFrom = ' FROM clofor_com_cfs__FMSBillPayReq__c ';
        String strWhere = 'WHERE clofor_com_cfs__PaymentRequestID__c = \'' + paymentId + '\'' ;
        String strOrderBy = ' ORDER BY Name';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
    private String stringQueryPlanBill(String paymentId, String BillId){
        String strSelect = 'SELECT Sum(clofor_com_cfs__FMSBillID__r.clofor_com_cfs__SellInTaxAmountJPY__c),clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Anken__r.clofor_com_cfs__POL__r.Name POL, clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Anken__r.clofor_com_cfs__POD__r.Name POD, ' + String.join(new List<String>(setFieldsPlan), ',');
        String strFrom = ' FROM clofor_com_cfs__FMSBillPayReq__c ';
        String strWhere = 'WHERE clofor_com_cfs__PaymentRequestID__c = \'' + paymentId + '\' AND clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Seikyusaki__c = \'' + BillId + '\'' ;
        String strOrderBy = ' GROUP BY clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Anken__r.clofor_com_cfs__POL__r.Name, clofor_com_cfs__FMSBillID__r.clofor_com_cfs__Anken__r.clofor_com_cfs__POD__r.Name, '+String.join(new List<String>(setFieldsPlan), ',');
        return strSelect + strFrom + strWhere + strOrderBy;
    }
    private String stringQueryBank(String bankId){
        String strSelect = 'SELECT clofor_com_cfs__BankOfficialName__c, BankCode__c, BranchName__c, BranchCode__c, clofor_com_cfs__BankAccountNumber__c, AccountType__c, clofor_com_cfs__BankAccountNameInLocal__c';
        String strFrom = ' FROM clofor_com_cfs__BankAccount__c ';
        String strWhere = 'WHERE Id = \'' + bankId + '\'' ;
        String strOrderBy = ' ORDER BY Name'; 
        return strSelect + strFrom + strWhere + strOrderBy;
    }

    public class ResultWrapper{
        public Integer Index {get; set;}
        public String RefNo {get;set;}
        public String RecordTypeShipment {get;set;}
        public String InvoiceNo {get;set;}
        public String POL {get;set;}
        public Date ETD {get;set;}
        public String POD {get;set;}
        public Date ETA {get; set;}
        public String HouseBL {get; set;}
        public Decimal AmountPlan {get; set;}
        public ResultWrapper(){
            this.Index = 0;
            this.RefNo = '';
            this.RecordTypeShipment = '';
            this.InvoiceNo = '';
            this.POL = '';
            this.POD = '';
            this.HouseBL = '';
            AmountPlan = 0;
        }
    }
}