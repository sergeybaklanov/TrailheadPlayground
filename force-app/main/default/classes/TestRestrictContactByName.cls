/**
 * Created by User on 20.10.2022.
 */

@IsTest
private class TestRestrictContactByName {
    @IsTest
    static void restrictContactByNameTest() {
        Contact contact = new Contact(FirstName='Sergey',LastName='anton');
        Test.startTest();
        Database.SaveResult result= Database.insert (contact);
        Test.stopTest();
        System.assert(result.isSuccess());
        System.assert(result.getErrors().size() == 0);
        //System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',result.getErrors()[0].getMessage());
    }
    @IsTest
    static void restrictContactByNameCrushTest() {
        Contact contact = new Contact(FirstName='Sergey',LastName='INVALIDNAME');
        Test.startTest();
        Database.SaveResult result= Database.insert (contact);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',result.getErrors()[0].getMessage(),'The Last Name "INVALIDNAME" is not allowed for DML');
    }
}