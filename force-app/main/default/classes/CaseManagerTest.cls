@isTest
private class CaseManagerTest {
    @TestSetup
    static void makeData(){
        Case caseTest = new Case(
            Subject='Test record',
            Status='New',
            Origin='Phone',
            Priority='Medium'
        );
        insert caseTest;
    }

    @isTest
    static void testGetCaseById() {
        // Get the test case created in the Test Setup method
        Case testCase = [SELECT Id FROM Case WHERE Subject = 'Test record'];

        // Prepare the test request
        RestRequest req = new RestRequest();
        req.requestUri = '/services/apexrest/Cases/' + testCase.Id;
        req.httpMethod = 'GET';
        RestContext.request = req;

        // Call the getCaseById method
        Case result = CaseManager.getCaseById();

        // Assert that the returned case is the expected one
        System.assertEquals(testCase.Id, result.Id, 'Unexpected case returned');
    }

    @isTest
    static void testCreateCase() {
        // Prepare the test request
        RestRequest req = new RestRequest();
        req.requestUri = '/services/apexrest/Cases/';
        req.httpMethod = 'POST';
        req.requestBody = Blob.valueOf(JSON.serialize(new Map<String, Object> {
            'Subject' => 'Test Case',
            'Status' => 'New',
            'Origin' => 'Phone',
            'Priority' => 'Medium'
        }));
        RestContext.request = req;

        // Call the createCase method
        Id caseId = CaseManager.createCase();

        // Query for the newly created case and assert that it exists
        Case newCase = [SELECT Id, Subject, Status, Origin, Priority FROM Case WHERE Id = :caseId];
        System.assert(newCase != null, 'Case was not created');
    }

    @isTest
    static void testDeleteCase() {
        // Get the test case created in the Test Setup method
        Case testCase = [SELECT Id FROM Case WHERE Subject = 'Test record'];

        // Prepare the test request
        RestRequest req = new RestRequest();
        req.requestUri = '/services/apexrest/Cases/' + testCase.Id;
        req.httpMethod = 'DELETE';
        RestContext.request = req;

        // Call the deleteCase method
        CaseManager.deleteCase();

        // Query for the test case and assert that it's been deleted
        List<Case> deletedCase = [SELECT Id FROM Case WHERE Id = :testCase.Id];
        System.assert(deletedCase.size() == 0, 'Case was not deleted');
    }

    @isTest
    static void testUpsertCase() {
        // Prepare the test request
        RestRequest req = new RestRequest();
        req.requestUri = '/services/apexrest/Cases/';
        req.httpMethod = 'PUT';
        Id caseId = CaseManager.upsertCase('Test Case', 'New', 'Phone', 'Medium', null);

        // Query for the newly created case and assert that it exists

        Case newCase = [SELECT Id, Subject, Status, Origin, Priority FROM Case WHERE Id = :caseId];
        System.assert(newCase != null, 'Case was not upserted');

        // Update the case and call the upsertCase method again
        req.requestUri = '/services/apexrest/Cases/' + newCase.Id;
        caseId = CaseManager.upsertCase('Updated Test Case', 'New', 'Phone', 'Medium', newCase.Id);

        // Query for the updated case and assert that it exists and has the correct values
        Case updatedCase = [SELECT Id, Subject, Status, Origin, Priority FROM Case WHERE Id = :caseId];
        System.assert(updatedCase != null, 'Case was not upserted');
        System.assertEquals('Updated Test Case', updatedCase.Subject, 'Unexpected subject');
    }

    @isTest
    static void testUpdateCaseFields() {
        // Get the test case created in the Test Setup method
        Case testCase = [SELECT Id FROM Case WHERE Subject = 'Test record'];

        // Prepare the test request
        RestRequest req = new RestRequest();
        req.requestUri = '/services/apexrest/Cases/' + testCase.Id;
        req.httpMethod = 'PATCH';
        req.requestBody = Blob.valueOf(JSON.serialize(new Map<String, Object> {
            'Subject' => 'Updated Test Case',
            'Status' => 'In Progress'
        }));
        RestContext.request = req;

        // Call the updateCaseFields method
        Id caseId = CaseManager.updateCaseFields();

        // Query for the updated case and assert that it exists and has the correct values
        Case updatedCase = [SELECT Id, Subject, Status, Origin, Priority FROM Case WHERE Id = :caseId];
        System.assert(updatedCase != null, 'Case was not updated');
        System.assertEquals('Updated Test Case', updatedCase.Subject, 'Unexpected subject');
        System.assertEquals('In Progress', updatedCase.Status, 'Unexpected status');
    }
}

