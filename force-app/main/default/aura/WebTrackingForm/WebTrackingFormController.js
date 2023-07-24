({
    init : function(component, event, helper) {
        var parseUrl = new URL(window.location.href);
        // var getListShipment = component.get("c.getListShipment");
        // getListShipment.setParams({
        //     "search": parseUrl.searchParams.get("search"),
        //     "type": parseUrl.searchParams.get("type")
        // });
        // getListShipment.setCallback(this, function(response){
        //     var state = response.getState();
        //     if (state === "SUCCESS") {
        //         component.set("v.lstShipment", response.getReturnValue());
        //         console.log(component.get("c.lstShipment"));
        //     } else {
        //         console.log(response.getError());
        //     }
        // });
        // $A.enqueueAction(getListShipment);

        // get tracking
        var getIdShipment = component.get("c.getIdShipment");
        getIdShipment.setParams({
            "search": parseUrl.searchParams.get("search"),
            "type": parseUrl.searchParams.get("type")
        });
        getIdShipment.setCallback(this, function(response){
            var state = response.getState();
            console.log(state);
            console.log(response);
            if (state === "SUCCESS") {
                component.set("v.shipId", response.getReturnValue());
                component.set("v.showTracking", true);
                console.log(component.get("v.shipId"));
                component.set("v.showTable", false);
                component.set("v.showTracking", true);
                $A.createComponent(
                    "c:WebTracking",
                    {
                        recordId: component.get("v.shipId")
                    },
                    (WebTracking, status, errorMessage) => {
                        if (status === "SUCCESS") {
                            var body = component.get("v.body");
                            body.push(WebTracking);
                            component.set("v.body", body);
                            console.log('thanh cong');
                            // component.set("v.showTable", false);
                            // component.set("v.showTracking", true);
                        }
                        else if (status === "INCOMPLETE") {
                            console.log("No response from server or client is offline.")
                        }
                        else if (status === "ERROR") {
                            console.log("Error: " + errorMessage);
                        }
                    }
                );
            } else {
                component.set("v.mess","No records returned.");
                console.log(response.getError());
            }
        });
        $A.enqueueAction(getIdShipment);
    },
    selectOne: function(component, event , helper)
    {
        var childCheckbox = event.getSource().get("v.value");
        console.log(childCheckbox);
        var checkId = event.getSource().get("v.name");
        console.log(checkId);
        component.set("v.shipId", event.getSource().get("v.name"));
    },
    getTracking: function(component, event, helper)
    {
        var arrTrue = [];
        var check = component.find("checkIdSo");
        var lstShip = component.get("v.lstShipment");
        if (lstShip.length == 1) {
            if (check.get("v.value") == true){
                arrTrue.push(check.get("v.name"));
            }
        } else {
            for (var i = 0; i < check.length; i++){
                if (check[i].get("v.value") == true){
                    arrTrue.push(check[i].get("v.name"));
                }
            }
        }
        if (arrTrue.length > 0 && arrTrue.length <2){
            component.set("v.showTracking", true);
            component.set("v.showTable", false);
            component.set("v.showTracking", true);
            $A.createComponent(
                "c:WebTracking",
                {
                    recordId: component.get("v.shipId")
                },
                (WebTracking, status, errorMessage) => {
                    if (status === "SUCCESS") {
                        var body = component.get("v.body");
                        body.push(WebTracking);
                        component.set("v.body", body);
                        // component.set("v.showTable", false);
                        // component.set("v.showTracking", true);
                    }
                    else if (status === "INCOMPLETE") {
                        console.log("No response from server or client is offline.")
                    }
                    else if (status === "ERROR") {
                        console.log("Error: " + errorMessage);
                    }
                }
            );
        }
    }
})