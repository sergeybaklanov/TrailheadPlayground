public class AccountProcessor {

    @future
    public static void countContacts(List<Id> incomeAccounts){

        List<Account> listAccounts = [SELECT Id,Number_Of_Contacts__c, (SELECT Id FROM Contacts) 
                                       FROM Account 
                                       WHERE Id IN :incomeAccounts];
        
        List<Account> listToUpdate = new List<Account>();
        
        for(Account account : listAccounts){
            account.Number_Of_Contacts__c=account.Contacts.size();
            listToUpdate.add(account);     
        }
        update listToUpdate;

    }

}