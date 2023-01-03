@isTest
global class AnimalLocatorMock  implements HttpCalloutMock {
    global HttpResponse respond (HttpRequest request)
    {
        HttpResponse response =new HttpResponse();
        response.setHeader('Content-Type', 'application/json; charset=UTF-8');
        response.setBody('{"animals":["lion","fox","bear","panda","snake","raccooon"]}');
        response.setStatusCode(200);
        return response;
    }
}