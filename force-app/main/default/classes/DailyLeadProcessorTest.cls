// Create an Apex test class:
// Name: DailyLeadProcessorTest
// In the test class, insert 200 Lead records, schedule the DailyLeadProcessor class to 
// run and test that all Lead records were updated correctly
// The unit tests must cover all lines of code included in the DailyLeadProcessor class, 
// resulting in 100% code coverage.

@IsTest
private class DailyLeadProcessorTest {
    @TestSetup
    static void makeData(){
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
                leads.add(new Lead(FirstName='Lead'+i,LeadSource=null,Company='Company',LastName='Last'+i));
        }
        insert leads;
    }

   @isTest
   public static void recordUpdateSheduleTest(){
    String CRON_EXP = '0 0 1 * * ?';
    Test.startTest();
        String jobId = System.schedule('Update leadSource', CRON_EXP,new DailyLeadProcessor());
        System.assertEquals(0,[SELECT COUNT() FROM Lead WHERE LeadSource='Dreamforce'], 'Task exist before the job was run');
    Test.stopTest();
    System.assertEquals(200,[SELECT COUNT() FROM Lead WHERE LeadSource='Dreamforce'],'Task were not created');
   }
}
