public with sharing class HBLController {
    public clofor_com_cfs__CustomObject1__c shipment {get; set;}
    public Signature__c signature {get; set;}

    public String strQuery {get; set;}
    public String strQuerySignature {get; set;}
    public String shipmentID {get; set;}
    public String TypeOfForm {get; set;}
    public String TypeOfPrint {get; set;}
    public String TypeSelected {get; set;}
    public String billing {get; set;}
    public String formtype {get; set;}
    public String printtype {get; set;}
    public String MasterAt {get; set;}
    public Decimal numb{get;set;}
    public Integer temp{get;set;}
    public String numberOrdinal{get;set;}
    public String cargotype{get;set;}
    public String signatureImg{get;set;}
    public Boolean isCreateNumber {get;set;}
    public Boolean isCreateCondition {get;set;}
    public Boolean isCreateCondition1 {get;set;}

    private static Set<String> setFields = new Set<String>();
    static{
        setFields.add('clofor_com_cfs__ADDRESS_ON_B_L__c');
        setFields.add('clofor_com_cfs__CNEE_ADDRESS_ON_B_L__c');
        setFields.add('clofor_com_cfs__NOTIFY_ADDRESS_ON_B_L__c');
        setFields.add('clofor_com_cfs__PlaceOfReceiptDetailPrint__c');
        setFields.add('clofor_com_cfs__PortOfLoadingDetailPrint__c');
        setFields.add('clofor_com_cfs__Vessle__c');
        setFields.add('clofor_com_cfs__Voy_No__c');
        setFields.add('clofor_com_cfs__PortOfDischargeDetailPrint__c');
        setFields.add('clofor_com_cfs__PlaceOfDeliveryDetailPrint__c	');
        setFields.add('clofor_com_cfs__CONTAINERSEALNO__c');
        setFields.add('clofor_com_cfs__carton__c');
        setFields.add('clofor_com_cfs__Marks_and_Numbers__c');
        setFields.add('clofor_com_cfs__Freight_and_charges__c');
        
        setFields.add('clofor_com_cfs__Item__c');
        setFields.add('clofor_com_cfs__weight__c');
        setFields.add('clofor_com_cfs__CBM__c');
        setFields.add('clofor_com_cfs__NumberOfContainers__c');
        setFields.add('clofor_com_cfs__Freight_Collect_Prepaid__c');
        setFields.add('clofor_com_cfs__DATE_OF_HOUSE_BL_ISSUED__c');
        setFields.add('clofor_com_cfs__No_of_Original_BL__c');
        setFields.add('clofor_com_cfs__ETA__c');
        setFields.add('clofor_com_cfs__ETD__c');
        setFields.add('clofor_com_cfs__UnitType__c');
        setFields.add('HouseShipper__c');
        setFields.add('HouseNotifyParty__c');
        setFields.add('HouseConsignee__c');
        setFields.add('clofor_com_cfs__shipper__c');
        setFields.add('clofor_com_cfs__Cnee__c');
        setFields.add('clofor_com_cfs__Cnee__r.InformationonBL__c');
        setFields.add('clofor_com_cfs__Cnee__r.Phone');
        setFields.add('clofor_com_cfs__Cnee__r.Fax');
        setFields.add('clofor_com_cfs__Cnee__r.clofor_com_cfs__EnglishAddress__c');
        setFields.add('clofor_com_cfs__Cnee__r.clofor_com_cfs__EnglishCompanyName__c');
        
        setFields.add('clofor_com_cfs__SecondNotifyParty__c');
        setFields.add('clofor_com_cfs__shipper__r.InformationonBL__c');
        setFields.add('clofor_com_cfs__shipper__r.clofor_com_cfs__EnglishCompanyName__c');
        setFields.add('clofor_com_cfs__shipper__r.Phone');
        setFields.add('clofor_com_cfs__shipper__r.Fax');
        setFields.add('clofor_com_cfs__shipper__r.clofor_com_cfs__EnglishAddress__c');
        setFields.add('clofor_com_cfs__DeliveryAgent__r.InformationonBL__c');
        setFields.add('clofor_com_cfs__SecondNotifyParty__r.InformationonBL__c');
        setFields.add('clofor_com_cfs__DeliveryAgent__r.Fax');
        setFields.add('clofor_com_cfs__DeliveryAgent__r.Phone');
        setFields.add('clofor_com_cfs__Notifyparty__r.clofor_com_cfs__EnglishAddress__c');
        setFields.add('clofor_com_cfs__Notifyparty__r.clofor_com_cfs__EnglishCompanyName__c');
        setFields.add('clofor_com_cfs__DeliveryAgent__r.clofor_com_cfs__EnglishAddress__c');
        setFields.add('clofor_com_cfs__DeliveryAgent__r.clofor_com_cfs__EnglishCompanyName__c');
        setFields.add('clofor_com_cfs__HBL__c');
        setFields.add('ClickCount__c');
        setFields.add('clofor_com_cfs__Notifyparty__c');
        setFields.add('clofor_com_cfs__Notifyparty__r.InformationonBL__c');
        setFields.add('clofor_com_cfs__Notifyparty__r.Phone');
        setFields.add('clofor_com_cfs__Notifyparty__r.Fax');
        setFields.add('clofor_com_cfs__REFNO__c');
        setFields.add('clofor_com_cfs__HBL_Number_SEA_AIR__c');
        setFields.add('Attachment__c');
        setFields.add('clofor_com_cfs__Master_No_of_Original_B_s_L__c');
        setFields.add('Description_Long__c');
        setFields.add('clofor_com_cfs__BLtype__c');
        setFields.add('clofor_com_cfs__Payable_at__c');
        setFields.add('clofor_com_cfs__MFreight_Collect_Prepaid__c');
        setFields.add('clofor_com_cfs__Prepaid_at__c');
        setFields.add('Name');
        setFields.add('clofor_com_cfs__CARGO_TYPE__c');
        setFields.add('Approver__c');
        setFields.add('MasterConsignee__c');
        setFields.add('Container_Type_All__c');
        setFields.add('clofor_com_cfs__Container_Measurement_Details__c');
    }
    public HBLController() {
        billing = ApexPages.currentPage().getParameters().get('billing');
        formtype = ApexPages.currentPage().getParameters().get('formtype');
        printtype = ApexPages.currentPage().getParameters().get('printtype');
        isCreateNumber = ApexPages.currentPage().getParameters().get('isNumber') == 'true';
        isCreateCondition = ApexPages.currentPage().getParameters().get('isCondition') == 'true';
        // numb = 0;
        // numb = Decimal.valueOf(ApexPages.currentPage().getParameters().get('numb'));
        // System.debug('click :'+numb);
        shipmentID = ApexPages.currentPage().getParameters().get('id');
        shipment = new clofor_com_cfs__CustomObject1__c();
        signature = new Signature__c();
        strQuery = '';
        strQuerySignature = '';
        TypeOfForm = '';
        TypeOfPrint = '';
        TypeSelected = '';
        numberOrdinal = '';
        MasterAt = '';
        cargotype = '';
        signatureImg = '';
        temp = 0;
        // numb = numb + 1;

        // System.debug('click :'+numb);
        strQuery = stringQueryShipment(shipmentID);

        shipment = Database.query(strQuery);
        String approver = shipment.Approver__c;

        // for(Signature__c sin : signature){
        //     if(shipment.Approver__c == sin.Username__c){
        //         signatureImg = sin.Signature__c;
        //     }
        // }
        if(approver != null){
            strQuerySignature = stringQuerySignature(shipment,approver);
        }
        if(strQuerySignature != ''){
            signature = Database.query(strQuerySignature);
            signature.Signature__c = signature.Signature__c.replace('<img', '<img style="height: 25mm;width:55mm;padding-left: 500px;"');

        }
        System.debug('signature :'+signature);
        if(formtype == 'waybill'){
            TypeOfForm = 'WAY BILL ORIGINAL';
            TypeSelected = 'WAYBILL';
        }
        if(formtype == 'waybillcopy'){
            TypeOfForm = 'WAY BILL COPY';
            TypeSelected = 'WAYBILLCOPY';
        }
        if(formtype == 'bl'){
            TypeOfForm = 'BL ORIGINAL';
            TypeSelected = 'ORL';
        }
        if(formtype == 'blcopy'){
            TypeOfForm = 'BL COPY';
            TypeSelected = 'BLCOPY';
        }
        if(formtype == 'draftbl'){
            TypeOfForm = 'DRAFT BL';
            TypeSelected = 'DRAFT';
        }
        if(formtype == 'surrenderedbill'){
            TypeOfForm = 'SURRENDERED BILL';
            TypeSelected = 'SUR';
        }
        clofor_com_cfs__CustomObject1__c bills2 = [SELECT ClickCount__c
        FROM clofor_com_cfs__CustomObject1__c
        WHERE Id =: shipmentID
        ORDER By Name];

        temp = Integer.valueOf(bills2.ClickCount__c);

        // numberOrdinal = NumberToOrdinal.toOrdinal(temp);
        // if(shipment.clofor_com_cfs__Master_No_of_Original_B_s_L__c != null){
        //     numberOrdinal = shipment.clofor_com_cfs__Master_No_of_Original_B_s_L__c + ' ' +TypeOfForm;
        // }else {
        // numberOrdinal = TypeOfForm;
            
        // }

        if(shipment.clofor_com_cfs__No_of_Original_BL__c == 'One(1)'){
            numberOrdinal = 'FIRST';
        }if(shipment.clofor_com_cfs__No_of_Original_BL__c == 'Two(2)'){
            numberOrdinal = 'SECOND';
        }if(shipment.clofor_com_cfs__No_of_Original_BL__c == 'Three(3)'){
            numberOrdinal = 'THIRD';
        }

        if(shipment.clofor_com_cfs__CARGO_TYPE__c == 'CY/CY'){
            cargotype = 'CY';
        }
        if(shipment.clofor_com_cfs__CARGO_TYPE__c == 'CFS/CFS'){
            cargotype = 'CFS';
        }

        if(shipment.clofor_com_cfs__Freight_Collect_Prepaid__c == 'Freight Prepaid'){
            MasterAt = 'Prepaid';
        }
        if(shipment.clofor_com_cfs__Freight_Collect_Prepaid__c == 'Freight Collect'){
            MasterAt = 'Collect';
        }

        if(printtype == 'first'){
            TypeOfPrint = 'FIRST';
        }
        if(printtype == 'second'){
            TypeOfPrint = 'SECOND';
        }
        if(printtype == 'third'){
            TypeOfPrint = 'THIRD';
        }
        if(printtype == 'fourth'){
            TypeOfPrint = 'FOURTH';
        }

        String filename =shipment.Name + '_' + TypeSelected + 'HBL' + '_' + shipment.clofor_com_cfs__HBL_Number_SEA_AIR__c + '.pdf';
        Apexpages.currentPage().getHeaders().put('Content-Type', 'text/html; charset="UTF-8"');
        Apexpages.currentPage().getHeaders().put('content-disposition', 'inline; filename=\"'+EncodingUtil.urlEncode(filename,'utf-8'));
    }
    @AuraEnabled
    public static Boolean checkApp(String shipmentID){
        // String shipmentID = ApexPages.currentPage().getParameters().get('id');
        clofor_com_cfs__CustomObject1__c ship = [SELECT clofor_com_cfs__ApprovalStatus__c From clofor_com_cfs__CustomObject1__c WHERE Id =: shipmentID ORDER By Name];
        if(ship.clofor_com_cfs__ApprovalStatus__c == '--None--' || ship.clofor_com_cfs__ApprovalStatus__c == 'Submitted' || ship.clofor_com_cfs__ApprovalStatus__c == 'Pending ' || ship.clofor_com_cfs__ApprovalStatus__c == 'Rejected' || ship.clofor_com_cfs__ApprovalStatus__c == 'Others'){
            return true;
        }else if(ship.clofor_com_cfs__ApprovalStatus__c == 'Approved'){
            return false;
        }

        return true;
    }
    @AuraEnabled
    public static Integer changeNumber(String shipmentID){
System.debug('loggg :'+shipmentID);
        try {
            clofor_com_cfs__CustomObject1__c bills2 = [SELECT ClickCount__c
        FROM clofor_com_cfs__CustomObject1__c
        WHERE Id =: shipmentID
        ORDER By Name];


        if(bills2.ClickCount__c == null){
        bills2.ClickCount__c = 0;
        }
        bills2.ClickCount__c = bills2.ClickCount__c +1;
        update bills2;
        
        } catch(DmlException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        return 1;
        
    }

    public List<SelectOption> getSortOptions() {
        List<SelectOption> sortOptions = new List<SelectOption>();
        sortOptions.add(new SelectOption('','-Default-'));
        sortOptions.add(new SelectOption('Custom','Custom'));
        sortOptions.add(new SelectOption('Today','Today'));
        sortOptions.add(new SelectOption('This Week','This Week'));
        sortOptions.add(new SelectOption('This Quarter','This Quarter'));
        sortOptions.add(new SelectOption('This Year','This Year'));
        
        return sortOptions;
    }
    
    private String stringQueryShipment(String shipmentId){
        String strSelect = 'SELECT ' + String.join(new List<String>(setFields), ',');
        String strFrom = ' FROM clofor_com_cfs__CustomObject1__c ';
        String strWhere = 'WHERE Id = \'' + shipmentId + '\'' ;
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
    private String stringQuerySignature(clofor_com_cfs__CustomObject1__c shipment, String approver){
        
        String strSelect = 'SELECT Username__c, Signature__c';
        String strFrom = ' FROM Signature__c ';
        String strWhere = 'WHERE Username__c =\''+ approver +'\'' ;
        String strOrderBy = ' ORDER BY Name LIMIT 1';
        return strSelect + strFrom + strWhere + strOrderBy;
    }
}