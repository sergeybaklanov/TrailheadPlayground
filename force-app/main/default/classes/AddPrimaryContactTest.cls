@IsTest
public  class AddPrimaryContactTest {
    @TestSetup
    static void makeData(){
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
        accounts.add(new Account(Name='Account ' + i,BillingState='NY'));
        }
        for (Integer i = 50; i < 100; i++) {
            accounts.add(new Account(Name='Account ' + i,BillingState='CA'));
            }
        insert accounts;
        Contact contact = new Contact(FirstName='FNContact',LastName='LNContact');
        insert contact;
    }

    
 @isTest
 public static void addingContactCheck(){

    String state ='CA';  
    Contact contact = [SELECT Id,FirstName,LastName FROM Contact];

    AddPrimaryContact addContatc = new AddPrimaryContact(contact, state);
    Test.startTest();
        System.enqueueJob(addContatc);
    Test.stopTest();

    List <Account> accRes =[SELECT Id,Name,(SELECT Id,FirstName,LastName FROM Contacts WHERE FirstName='FNContact') 
    FROM Account 
    WHERE BillingState=:state];


    System.assertEquals(50,accRes.size());

 }
}
