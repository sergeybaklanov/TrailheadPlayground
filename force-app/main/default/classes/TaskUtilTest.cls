@isTest
private class TaskUtilTest {
    @isTest static void testTaskPriority() {
        String pri = TaskUtil.getTaskPriority('NY');
        System.assertEquals('Normal', pri);
    }
    @isTest static void testHighTaskPriority(){
         String pri = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }
    @isTest static void testNullReturn(){
         String pri = TaskUtil.getTaskPriority('Montana');
        System.assertEquals(null, pri);
    }
}