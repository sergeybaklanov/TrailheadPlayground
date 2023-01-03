public class AnimalsCallouts {
    public static HttpResponse makeGetCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if(response.getStatusCode()==200){
            Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Recieved the following animals: ');
            
            if(animals.size()>0 ){
                for(Object animal: animals){
                    System.debug(animal.toString());
                }
            }
        }
        return response;
    }


public static HttpResponse makePostCallout(){
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
    request.setMethod('POST');
    request.setHeader('Content-type','application/json; charset=UTF-8');
    request.setBody('{"name":"mighty moose"}');
    HttpResponse response = http.send(request);

    if(response.getStatusCode()!=201){
        System.debug('The status code returned was not espected: '+ 
        response.getStatusCode()+' '+response.getStatus());}
        else {
            System.debug(response.getBody());
        }
return response;
    }
 }