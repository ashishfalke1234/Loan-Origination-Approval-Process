import { LightningElement, track } from 'lwc';
// Import the Apex method we want to call
import fetchCreditScore from '@salesforce/apex/CreditCheckService.fetchCreditScore';

export default class CreditCheckButton extends LightningElement {
    // Use @track to make these properties reactive, so the UI updates when they change
    @track creditScore;
    @track error;
    @track isLoading = false;

    // This function runs when the user clicks the button
    handleFetchScoreClick() {
        this.isLoading = true; // Show the spinner
        this.error = undefined; // Clear previous errors
        this.creditScore = undefined; // Clear previous score

        // Call the Apex method
        fetchCreditScore()
            .then(result => {
                // This runs if the call is successful
                this.creditScore = result;
                this.isLoading = false; // Hide the spinner
            })
            .catch(error => {
                // This runs if the call fails
                this.error = 'Could not retrieve credit score. ' + error.body.message;
                this.isLoading = false; // Hide the spinner
            });
    }
}