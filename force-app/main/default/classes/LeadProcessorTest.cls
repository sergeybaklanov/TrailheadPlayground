@IsTest
public class LeadProcessorTest {
 @TestSetup
 static void makeData(){
    List<Lead> leads = new List<Lead>();
    for (Integer i = 0; i < 10; i++) {
        leads.add(new Lead(LeadSource='Random',FirstName ='Leads' + i,LastName='LastName',Company='Company'));
    } 
    insert leads;
    }
    @isTest
    static void testLeadUpdating(){
        Test.startTest();
    LeadProcessor process = new LeadProcessor();
    Id batchId = Database.executeBatch(process);
        Test.stopTest();

      System.assertEquals(10,[SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce']);

    }
}