## Problem Statement
In the Salesforce instance there is a custom object named `Calculator__c` with the following fields: `NumberA__c`, `NumberB__c`, `Sum__c`, `Difference__c`, `Product__c` and `Quotient__c`. 

#
Your task is to create an automation process which execute basic calculations on the `Calculator__c` object and saves it to the relevant fields as followed:
- `Sum__c` should contains the result of addition of `NumberA__c` and `NumberB__c`
- `Difference__c` should contains the result of subtraction of `NumberB__c` from `NumberA__c`
- `Product__c` should contains the result of multiplication of `NumberA__c` and `NumberB__c`
- `Quotient__c` should contains the result of division of `NumberA__c` by `NumberB__c`

## Important note
The calculations should be performed in both: when the record is created and edited.

##
Good luck!