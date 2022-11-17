@isTest
private class CalculatorTest {

    @isTest
    private static void shouldAddTwoNumbers() {
        //given
        Calculator__c calc = createCalculator(2, 3);

        //when
        Test.startTest();
            Insert calc;
        Test.stopTest();

        Calculator__c result = getCalculatorById(calc.Id);    
        //then
        System.assertEquals(5, result.Sum__c);
    }

    @isTest
    private static void shouldSubtractTwoNumbers() {
        //given
        Calculator__c calc = createCalculator(9, 2);

        //when
        Test.startTest();
            Insert calc;
        Test.stopTest();

        Calculator__c result = getCalculatorById(calc.Id);    
        //then
        System.assertEquals(7, result.Difference__c);
    }

    @isTest
    private static void shouldMultiplyTwoNumbers() {
        //given
        Calculator__c calc = createCalculator(4, 3);

        //when
        Test.startTest();
            Insert calc;
        Test.stopTest();

        Calculator__c result = getCalculatorById(calc.Id);    
        //then
        System.assertEquals(12, result.Product__c);
    }

    @isTest
    private static void shouldDivideTwoNumbers() {
        //given
        Calculator__c calc = createCalculator(18, 3);

        //when
        Test.startTest();
            Insert calc;
        Test.stopTest();

        Calculator__c result = getCalculatorById(calc.Id);    
        //then
        System.assertEquals(6, result.Quotient__c);
    }

    @isTest
    private static void shouldProcessOperationsOnUpdate() {
        //given
        Calculator__c calc = createCalculator(1, 1);
        Insert calc;

        //when
        Test.startTest();
            calc.NumberA__c = 20;
            calc.NumberB__c = 5;
            update calc;
        Test.stopTest();

        Calculator__c result = getCalculatorById(calc.Id);    
        //then
        System.assertEquals(25, result.Sum__c);
        System.assertEquals(15, result.Difference__c);
        System.assertEquals(100, result.Product__c);
        System.assertEquals(4, result.Quotient__c);
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