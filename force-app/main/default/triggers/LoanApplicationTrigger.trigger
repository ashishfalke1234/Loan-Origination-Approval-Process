trigger LoanApplicationTrigger on Loan_Application__c (before insert, before update) {

    for (Loan_Application__c loanApp : Trigger.new) {

        Decimal interestRate = 8.5;

        // --- FIX IS HERE ---
        // We must convert the Term_Months__c (which is a Decimal) to an Integer
        // to match the signature of the calculateEMI method.
        Integer termAsInteger = loanApp.Term_Months__c == null ? 0 : loanApp.Term_Months__c.intValue();

        Decimal calculatedEmi = LoanCalculator.calculateEMI(
            loanApp.Loan_Amount__c,
            interestRate,
            termAsInteger // We now pass the correctly typed Integer variable
        );

        loanApp.Estimated_EMI__c = calculatedEmi;
    }
}