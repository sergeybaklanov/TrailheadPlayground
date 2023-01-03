@IsTest
global class AccountManagerTest {
  
  @isTest
  static void testGetAccount(){

    Id recordId = createTestRecord();
    RestRequest request = new RestRequest();
    request.requestUri='https://yourInstance.my.salesforce.com/services/apexrest/Accounts/'+recordId+'/contacts';   
    request.httpMethod = 'GET';
    RestContext.request = request;

    Account myAcct = AccountManager.getAccount();

    System.assert(myAcct!=null);
    System.assertEquals('Test record', myAcct.Name);

  }

  static Id createTestRecord(){
    Account accountTest = new Account(
        Name='Test record');
        insert accountTest;
        
        Contact contactTest = new Contact(
            FirstName='John',
            LastName='Doe',
            AccountId=accountTest.Id);

            insert contactTest;

            return accountTest.Id;
  }
}