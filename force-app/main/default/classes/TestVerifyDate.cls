@IsTest
private class TestVerifyDate {
     @IsTest static void testCheckDates(){
         Date date1 = Date.newInstance(2022,10,10);
         Date date2 = Date.newInstance(2022,11,25);
         Date result =  VerifyDate.CheckDates(date1,date2);
         Date expectResult = Date.newInstance(2022,10,31);
         System.assertEquals(expectResult,result);
    }
    @IsTest static void testCheckDatesDate2(){
        Date date1 = Date.newInstance(2022,10,10);
        Date date2 = Date.newInstance(2022,10,25);
        Date result =  VerifyDate.CheckDates(date1,date2);
        Date expectResult = Date.newInstance(2022,10,25);
        System.assertEquals(expectResult,result);
    }
}