@isTest
private class LoanCalculatorTest {

    @isTest
    static void testPositiveEMICalculation() {
        // --- 1. Arrange: Create our test data ---
        // We are creating a new Loan Application record in memory for this test.
        Loan_Application__c testLoan = new Loan_Application__c();
        testLoan.Loan_Amount__c = 500000;
        testLoan.Term_Months__c = 120; // 10 years

        // --- 2. Act: Perform the action we want to test ---
        // We start the test context and then insert the record.
        // The 'insert' action will cause our LoanApplicationTrigger to fire automatically.
        Test.startTest();
        insert testLoan;
        Test.stopTest();

        // --- 3. Assert: Verify the result ---
        // We need to get the updated record from the database to see the result of the trigger.
        Loan_Application__c resultLoan = [SELECT Estimated_EMI__c FROM Loan_Application__c WHERE Id = :testLoan.Id];

        // For a 500,000 loan at 8.5% over 120 months, the EMI is ~6200.52
        Decimal expectedEmi = 6200.52;

        // System.assertEquals checks if the actual value matches our expected value.
        // This is the line that makes our test pass or fail.
        System.assertEquals(expectedEmi, resultLoan.Estimated_EMI__c, 'The EMI was not calculated correctly for a positive scenario.');
    }

    @isTest
    static void testZeroInputs() {
        // --- Arrange ---
        // Create a loan application with zero values, which should result in a zero EMI.
        Loan_Application__c testLoan = new Loan_Application__c();
        testLoan.Loan_Amount__c = 0;
        testLoan.Term_Months__c = 0;

        // --- Act ---
        Test.startTest();
        insert testLoan;
        Test.stopTest();

        // --- Assert ---
        Loan_Application__c resultLoan = [SELECT Estimated_EMI__c FROM Loan_Application__c WHERE Id = :testLoan.Id];
        Decimal expectedEmi = 0;

        // Verify that our code handles zero inputs gracefully.
        System.assertEquals(expectedEmi, resultLoan.Estimated_EMI__c, 'The EMI should be zero when inputs are zero.');
    }
}