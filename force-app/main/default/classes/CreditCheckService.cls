public with sharing class CreditCheckService {

    // This annotation makes our method available to be called from a Lightning Web Component.
    @AuraEnabled(cacheable=true)
    public static Integer fetchCreditScore() {
        // 1. Prepare the HTTP Request
        HttpRequest request = new HttpRequest();

        // --- IMPORTANT: REPLACE THIS URL ---
        // Use the Beeceptor URL you created. It must include the /score path.
        String endpoint = 'https://ashish-loan-check.free.beeceptor.com/score';
        // ------------------------------------

        request.setEndpoint(endpoint);
        request.setMethod('GET');

        // 2. Send the Request and Get the Response
        Http http = new Http();
        HttpResponse response = http.send(request);

        // 3. Process the Response
        // Check if the call was successful (HTTP status code 200 means 'OK')
        if (response.getStatusCode() == 200) {
            // Parse the JSON response body to get the score.
            // We create a "wrapper class" to easily access the JSON properties.
            CreditScoreResponse responseWrapper = (CreditScoreResponse) JSON.deserialize(
                response.getBody(),
                CreditScoreResponse.class
            );

            // Return just the credit score integer
            return responseWrapper.creditScore;
        } else {
            // If the callout fails for any reason, throw an exception.
            throw new CalloutException('Callout failed with status code: ' + response.getStatusCode());
        }
    }

    /**
     * @description An inner "wrapper" class to represent the structure of our JSON response.
     * This makes it very easy and safe to parse the JSON.
     */
    public class CreditScoreResponse {
        public String status;
        public Integer creditScore;
        public String bureau;
    }
}