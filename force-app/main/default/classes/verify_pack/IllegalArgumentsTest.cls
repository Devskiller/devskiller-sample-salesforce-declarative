@isTest
private class IllegalArgumentsTest {

    @isTest
	private static void shouldQuotientBeNullForDivisionByZero() {
        //given
        Calculator__c calc = createCalculator(18, 0);

        //when
        Test.startTest();
            Insert calc;
        Test.stopTest();

        Calculator__c result = getCalculatorById(calc.Id);    
        //then
        System.assertEquals(null, result.Quotient__c);
    }
    
    private static Calculator__c createCalculator(Double numberA, Double numberB) {
        return new Calculator__c(
            NumberA__c = numberA,
            NumberB__c = numberB
        );
    }

    private static Calculator__c getCalculatorById(Id calcId) {
        return [
            SELECT
                NumberA__c,
                NumberB__c,
                Sum__c,
                Difference__c,
                Product__c,
                Quotient__c
            FROM
                Calculator__c
            WHERE
                Id = :calcId
        ];
    }

}