@isTest
private class RandomNumbersTest {

    @isTest
    private static void shouldAddTwoNumbers() {
        //given
        Integer numberA = getRandom();
        Integer numberB = getRandom();
        Calculator__c calc = createCalculator(numberA, numberB);

        //when
        Test.startTest();
            Insert calc;
        Test.stopTest();

        Calculator__c result = getCalculatorById(calc.Id);    
        //then
        System.assertEquals(numberA + numberB, result.Sum__c);
    }

    @isTest
    private static void shouldSubtractTwoNumbers() {
        //given
        Integer numberA = getRandom();
        Integer numberB = getRandom();
        Calculator__c calc = createCalculator(numberA, numberB);

        //when
        Test.startTest();
            Insert calc;
        Test.stopTest();

        Calculator__c result = getCalculatorById(calc.Id);    
        //then
        System.assertEquals(numberA - numberB, result.Difference__c);
    }

    @isTest
    private static void shouldMultiplyTwoNumbers() {
        //given
        Integer numberA = getRandom();
        Integer numberB = getRandom();
        Calculator__c calc = createCalculator(numberA, numberB);

        //when
        Test.startTest();
            Insert calc;
        Test.stopTest();

        Calculator__c result = getCalculatorById(calc.Id);    
        //then
        System.assertEquals(numberA * numberB, result.Product__c);
    }

    @isTest
    private static void shouldDivideTwoNumbers() {
        //given
        Integer numberA = getRandom();
        Integer numberB = getRandom();
        Calculator__c calc = createCalculator(numberA, numberB);

        //when
        Test.startTest();
            Insert calc;
        Test.stopTest();

        Calculator__c result = getCalculatorById(calc.Id);
        Decimal numberADec = Decimal.valueOf(numberA);
        Decimal numberBDec = Decimal.valueOf(numberB);
        Decimal expected = numberADec / numberBDec;

        //then
        System.assertEquals(expected.setScale(2), result.Quotient__c.setScale(2));
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
    
    private static Integer getRandom() {
        return Integer.valueof((Math.random() * 100)) + 1;
    }

}