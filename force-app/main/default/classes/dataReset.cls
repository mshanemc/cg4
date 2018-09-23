public with sharing class dataReset {

    @AuraEnabled
    public static void dataReset1() {
        Vehicle__c v = [select id, Vin__c, Scheduled_Maintenance__c from Vehicle__c where Vin__c = 'YV1DZ8256C2271234'];

        // move vehicle maint to Scheduled
        Scheduled_Maintenance__c SM = [select id, Status__c from Scheduled_Maintenance__c where id =: v.Scheduled_Maintenance__c];
        SM.Status__c = 'Scheduled';
        update SM;

    }

    @AuraEnabled
    public static void dataReset2() {
        Vehicle__c v = [select id, Vin__c, Scheduled_Maintenance__c from Vehicle__c where Vin__c = 'YV1DZ8256C2271234'];

        Drive__e d1 = new Drive__e();
        d1.Vin__c = v.Vin__c;
        d1.Ending_Odometer__c = 9995;
        Eventbus.publish(d1);

    }

    @AuraEnabled
    public static void dataReset3() {
        Vehicle__c v = [select id, Vin__c, Scheduled_Maintenance__c from Vehicle__c where Vin__c = 'YV1DZ8256C2271234'];
        Scheduled_Maintenance__c SM = [select id, Status__c from Scheduled_Maintenance__c where id =: v.Scheduled_Maintenance__c];

        SM.Status__c = 'Completed';
        update SM;

        // drop event
        Drive__e d2 = new Drive__e();
        d2.Vin__c = v.Vin__c;
        d2.Ending_Odometer__c = 200;
        Eventbus.publish(d2);

    }

    @AuraEnabled
    public static void dataReset4() {
        Vehicle__c v = [select id, Vin__c, Scheduled_Maintenance__c from Vehicle__c where Vin__c = 'YV1DZ8256C2271234'];

        Scheduled_Maintenance__c SM = [select id, Status__c from Scheduled_Maintenance__c where id =: v.Scheduled_Maintenance__c];

        SM.Status__c = 'Not scheduled';
        update SM;
    }

    public static void ResyncWithHeroku(){
        mutliplexSelfReg.reg();
    }


}
