public class HttpCalloutExample {
    public static void makeHttpCallout() {
        // TODO :: Remove hard coding - Define the endpoint URL
        String endpointUrl = 'https://postman-echo.com/get?foo1=bar1&foo2=bar2';

        // Create an HTTP request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpointUrl);
        request.setMethod('GET');

        // Create an HTTP client to send the request
        Http http = new Http();

        // Send the request and get the response
        HttpResponse response = http.send(request);

        // Check if the response is successful (HTTP status code 200)
        if (response.getStatusCode() == 200) {
            String responseBody = response.getBody();
            System.debug('HTTP Response Body: ' + responseBody);
        } else {
            System.debug('HTTP Request failed with status code: ' + response.getStatusCode());
        }
    }
}