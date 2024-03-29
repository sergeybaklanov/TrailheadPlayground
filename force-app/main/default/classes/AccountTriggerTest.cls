@IsTest
public with sharing class AccountTriggerTest{
    @isTest
    static void TestCreateNewAccountInBulk(){
        // Test Setup data
        // Create 200 new Accounts
        List<Account> accts = new List<Account>();
        for (Integer i = 0; i < 200; i++){
            Account acct = new Account(Name = 'Test Account ' + i, BillingState = 'CA');
            accts.add(acct);
        }
        // Perform Test
        Test.startTest();
        insert accts;
        Test.stopTest();
        // Verify that 200 new Accounts were inserted
        List<Account> verifyAccts = [SELECT Id, ShippingState, BillingState
                                     FROM Account];
        System.assertEquals(200, verifyAccts.size());
        for (Account account_i : verifyAccts){
            System.assertEquals('CA', account_i.ShippingState, 'Shipping state not equals billing state');
        }
    }

}