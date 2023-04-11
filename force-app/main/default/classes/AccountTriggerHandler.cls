public with sharing class AccountTriggerHandler{
    public static void CreateAccounts(List<Account> accountsList){
        for (Account account_i : accountsList){
            account_i.ShippingState = account_i.BillingState;
            // if (account_i.ShippingState != account_i.BillingState){
            //     account_i.addError('Shipping sdtate not equal to billing state');
            // }
        }
    }

}