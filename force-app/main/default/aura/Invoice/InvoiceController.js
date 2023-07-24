({
    
    init : function(component, event, helper){

    },  

    openNewTab : function(component, event, helper) {
        // var shipmentId = component.get('v.recordId')
        // console.log('shipmentId'+shipmentId);
        // window.open('/apex/page_InvoiceSelection?Id="shipmentId"','_blank')
        var recordId = component.get('v.recordId');
        window.open('/apex/page_InvoiceSelection?Id=' + recordId,'_blank');
    }
})