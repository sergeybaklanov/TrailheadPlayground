@IsTest
private class AccountProcessorTest {
    @testSetup
    static void setup(){

        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i <10; i++){
            accounts.add(new Account(Name='Test'+i,Number_Of_Contacts__c=0));
        }
        insert accounts;  

        List<Contact> listContacts = new List<Contact>();
        for (Integer i = 0; i < accounts.size(); i++) {
            for (Integer j = 0; j < 5; j++) {
                listContacts.add(new Contact(LastName=''+i+j,AccountId=accounts[i].id));
            }
        }
        insert listContacts;
    }

     @isTest
        public static void accountProcessorTest(){
            List<Account> listAccounts = [SELECT Id,Number_Of_Contacts__c,(SELECT Id FROM Contacts) FROM Account];
            Map<Id,Account> idMap = new Map<Id,Account>(listAccounts);
            List<Id> listIds = new List<Id>(idMap.keySet());

           // listIds.stream().sort((a1,a2)->a1.length()-a2.length());
            
            Test.startTest();
            AccountProcessor.countContacts(listIds);
            Test.stopTest();

            List<Account> accounts = [SELECT Id,Number_Of_Contacts__c FROM Account WHERE Id IN :listAccounts];


            for(Account a: accounts){
                System.assertEquals(5,a.Number_Of_Contacts__c,'Unexpected number of contacts!!!!!!');
            }

        }

}