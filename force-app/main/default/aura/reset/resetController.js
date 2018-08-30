({
    handleClick : function(component) {
        console.log('handleClick is running');
        var action1 = component.get("c.dataReset1");
        action1.setCallback(this, function(a){
            var state = a.getState();
            if (state === "SUCCESS") {
                console.log(a);
                window.setTimeout(
                    $A.getCallback(function(){
                        $A.enqueueAction(action2)
                    }), 1000);
            } else if (state === "ERROR") {
                console.log(a.getError());
            }
        });

        var action2 = component.get("c.dataReset2");
        action2.setCallback(this, function(a){
            var state = a.getState();
            if (state === "SUCCESS") {
                console.log(a);
                window.setTimeout(
                    $A.getCallback(function () {
                        $A.enqueueAction(action3);
                    }), 1000);
            } else if (state === "ERROR") {
                console.log(a.getError());
            }
        });

        var action3 = component.get("c.dataReset3");
        action3.setCallback(this, function (a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                console.log(a);
                window.setTimeout(
                    $A.getCallback(function () {
                        $A.enqueueAction(action4);
                    }), 1000);
            } else if (state === "ERROR") {
                console.log(a.getError());
            }
        });

        var action4 = component.get("c.dataReset4");
        action4.setCallback(this, function (a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                console.log(a);
                $A.get("e.force:showToast").setParams({ "type": "success", "message": "Demo Reset" }).fire();
            } else if (state === "ERROR") {
                console.log(a.getError());
            }
        });

        $A.enqueueAction(action1);
    }
})
