/**
 * Created by User on 29.10.2022.
 */

public with sharing class Callout {
    @AuraEnabled
    public static String makeGetRequest(Id recordId) {

        Http http = new Http();

        HttpRequest request = new HttpRequest();

        request.setMethod('GET');
        request.setHeader('objectName','Developer');
        request.setHeader('recordId',recordId);
        request.setEndpoint('https://avenga-school.herokuapp.com/retrieve-record');

        HttpResponse response = http.send(request);

        System.debug(response.getStatusCode());
        System.debug(response.getBody());

        if (response.getStatusCode() == 200) {
            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug(result);
        }
        return response.getBody()+'This is mine result';
    }
}