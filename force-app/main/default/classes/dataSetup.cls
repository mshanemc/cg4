public with sharing class dataSetup {

    public static void go() {
        Vehicle__c v = [select id, Scheduled_Maintenance__c from Vehicle__c where Vin__c = 'YV1DZ8256C2271234'];

        list<Scheduled_Maintenance__c> SMs = new list<Scheduled_Maintenance__c>();

        Scheduled_Maintenance__c SM = new Scheduled_Maintenance__c();
        SM.Target_Date__c = system.today().addDays(90);
        SM.Target_Mileage__c = 10000;
        SM.Vehicle__c = v.id;
        SM.Status__c = 'Not scheduled';
        SMs.add(SM);

        Scheduled_Maintenance__c SM2 = new Scheduled_Maintenance__c();
        SM2.Target_Date__c = system.today().addDays(180+90);
        SM2.Target_Mileage__c = 20000;
        SM2.Vehicle__c = v.id;
        SM2.Status__c = 'Not scheduled';
        SMs.add(SM2);

        Scheduled_Maintenance__c SM3 = new Scheduled_Maintenance__c();
        SM3.Target_Date__c = system.today().addDays(360+90);
        SM3.Target_Mileage__c = 30000;
        SM3.Vehicle__c = v.id;
        SM3.Status__c = 'Not scheduled';
        SMs.add(SM3);

        insert SMs;

        v.Scheduled_Maintenance__c = SM.Id;
        update v;


    }

}
