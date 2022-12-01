trigger AccountAddressTrigger on Account (before insert, before update) {
if(Trigger.isBefore){
    for(Account acc: Trigger.new){
            if((acc.Match_Billing_Address__c==true)&&(account.BillingPostalCode != NULL)){
                acc.ShippingPostalCode=acc.BillingPostalCode;
            }
    }
    }
}
