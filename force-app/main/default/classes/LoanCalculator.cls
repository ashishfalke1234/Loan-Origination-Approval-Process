public with sharing class LoanCalculator {

    public static Decimal calculateEMI(Decimal principal, Decimal annualRate, Integer termInMonths) {
        if (principal == null || principal == 0 || annualRate == null || annualRate == 0 || termInMonths == null || termInMonths == 0) {
            return 0;
        }

        Decimal monthlyRate = annualRate / (12 * 100);

        // --- FIX STARTS HERE ---
        // The Math.pow() method requires Double data types, so we must convert our values first.
        // We calculate the (1+r)^n part of the formula once and store it in a variable.

        Double powerTerm = Math.pow(
            (1 + monthlyRate).doubleValue(),  // Convert the Decimal base to a Double
            Double.valueOf(termInMonths)       // Convert the Integer exponent to a Double
        );

        // Now we use the calculated powerTerm in our main formula.
        // We convert it back to a Decimal to ensure our calculation maintains precision.
        Decimal emi = (principal * monthlyRate * Decimal.valueOf(powerTerm)) / (Decimal.valueOf(powerTerm) - 1);
        // --- FIX ENDS HERE ---

        return emi.setScale(2);
    }
}