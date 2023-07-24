({
    createComponent: function(component, shipId) {
        console.log('123453545');
        $A.createComponent(
            "c:WebTracking",
            {
                recordId: shipId
            },
            (WebTracking, status, errorMessage) => {
                if (status === "SUCCESS") {
                    var body = cloneCmp.get("v.body");
                    body.push(WebTracking);
                    cloneCmp.set("v.body", body);
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
})