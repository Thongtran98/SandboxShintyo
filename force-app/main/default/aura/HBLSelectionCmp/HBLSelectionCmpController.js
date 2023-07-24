/* eslint-disable capitalized-comments */
({
    doInit: function (component, event, helper) {
        // var recordId = component.get("v.recordId");
        // var changeNumber1 = component.get("c.changeNumber");
        
        var getDescribeSobjectResult = component.get("c.checkApp");
        getDescribeSobjectResult.setParams({shipmentID: component.get("v.recordId")});
        getDescribeSobjectResult.setCallback(this, function (response) {
            var state = response.getState();
            console.log('getDescribeSobjectResult: ', response);
            if (state === "SUCCESS") {
                var res = response.getReturnValue();
                console.log(res);
                if(res === true){
                    component.set("v.checkAll",true);
                }if(res === false){
                    component.set("v.checkApp",true);
                }
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                console.log("Error message: " + errors);
            }

        });
        $A.enqueueAction(getDescribeSobjectResult);

    },
    handleGenerate: function (component, event, helper) {
  
        var recordId = component.get("v.recordId");
        var billing = component.get("v.billing");
        console.log("billing: " + billing);
        var formtype = component.get("v.formtype");
        var printtype = component.get("v.printtype");
        var changeNum = component.get("c.changeNumber");
        var isCreateNumber = component.get("v.isNumber");
        var isCreateCondition = component.get("v.isCondition");
        changeNum.setParams({
            "shipmentID":recordId 
        });
        $A.enqueueAction(changeNum);

        
        var checkBL = component.get("v.checkBL");
        console.log(checkBL);
        if(checkBL === true){
            
        }else{
            printtype = '';
        }
        var url =
            "/apex/page_HBL?id=" + recordId;

        url += "&billing=" + billing;
        url += "&formtype=" + formtype;
        url += "&printtype=" + printtype;
        url += "&isNumber=" + isCreateNumber;
        url += "&isCondition=" + isCreateCondition;
        console.log("url: " + url);
        // url += "&numb=" + numb;
        // var urlEvent = $A.get("e.force:navigateToURL");
        if(billing == "none"){
            window.alert("The form is temporarily not allowed to print");
        }
        // window.location.href = url;
        window.open(url,'_blank');
        // eslint-disable-next-line no-console
        // console.log("url: " + url);
        // urlEvent.setParams({
        //     url: url
        // });
        // urlEvent.fire();

        
    },
    onBLChange: function (component, event, helper) {
        
        var checkBL = component.find("billingSelectType").get("v.value");
        console.log(checkBL);
        if(checkBL === 'bl' || checkBL === 'surrenderedbill'){
            component.set("v.checkBL",true);
        }else{
            component.set("v.checkBL",false);
        }
    }
});