({
    init : function(component, event, helper) {
        var getShipments = component.get("c.getShipments");
        getShipments.setParams({
            "id": component.get("v.recordId")
        });
        getShipments.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.shipment", response.getReturnValue());
            }
        });
        $A.enqueueAction(getShipments);

        var getTransitsByShipment = component.get("c.getTransitsByShipment");
        getTransitsByShipment.setParams({
            "shipmentId": component.get("v.recordId")
        });
        getTransitsByShipment.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.transits", response.getReturnValue());
            }
        });
        $A.enqueueAction(getTransitsByShipment);

        var getPositions = component.get("c.getPositions");
        getPositions.setParams({
            "shipmentId": component.get("v.recordId")
        });
        getPositions.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.positions", response.getReturnValue());
            }
        });
        $A.enqueueAction(getPositions);
    }
})