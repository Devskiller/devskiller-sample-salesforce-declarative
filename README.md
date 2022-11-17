# DevSkiller programming task sample - Salesforce Declarative

## Introduction

With [DevSkiller.com](https://devskiller.com) you can assess your candidates'
programming skills as a part of your recruitment process. We have found that
programming tasks are the best way to do this and have built our tests
accordingly. The way our test works is your candidate is asked to modify the
source code of an existing project.

During the test, your candidates have the option of using our browser-based
code editor and can build the project inside the browser at any time. If they
would prefer to use an IDE they are more comfortable with, they can also
clone the project’s Git repository and work locally.

You can check out this short video to see the test from the [candidate's
perspective](https://devskiller.zendesk.com/hc/en-us/articles/360019534639-How-the-TalentScore-test-looks-like-from-the-candidate-perspective).

This repo contains a sample project for Salesforce and below you can
find a detailed guide for creating your own programming project.

**Please make sure to read our [Getting started with programming
projects](https://devskiller.zendesk.com/hc/en-us/articles/360019531059-Getting-started-with-Programming-Tasks) guide first**

## Technical details

- The project structure has to have the sfdx project structure. All the files have to be in proper folders and include metadata files when needed (for example, the CalculatorTest Apex class consists of two files `CalculatorTest.cls` and `CalculatorTest.cls-meta.xml`).

- What is more, if your code includes custom objects or custom fields, their metadata files also have to be added to the structure (see the `Value__c.field-meta.xml` custom field of the `Tax__c` custom object in the example). The same thing goes for all other metadata like Profiles, Flows, Workflows, etc.

- Furthermore, the project has to include a permission set to all the necessary fields (both standard and custom). The permission set has to be named like in the example: `Fields.permissionset-meta.xml`.

## Automatic assessment

It is possible to automatically assess the solution posted by the candidate.
Automatic assessment is based on unit tests results and code quality
measurements.

There are two kinds of unit tests:

1. **Candidate tests** - unit tests that the candidate can see during the test
   should be used only for basic verification and to guide the candidate in
   understanding the requirements of the project. By default candidate tests **WILL NOT** be used
   to calculate the final score (see example in `CalculatorTest.cls`).
2. **Verification tests** - unit tests that the candidate can’t see during the
   test. Files containing verification tests will be added to the project after
   the candidate finishes the test and will be executed during the verification
   phase. The results of the verification tests will be used to calculate the
   final score(see example in `IllegalArgumentsTest.cls` and `RandomNumbersTest.cls`).

Once the solution is developed and submitted, the platform executes
verification tests and performs static code analysis.

## Devskiller project descriptor

Programming tasks can be configured with the Devskiller project descriptor file:

1. Create a `devskiller.json` file.
2. Place it in the root directory of your project.

Here is an example project descriptor:

```json
{
    "readOnlyFiles": [
        "force-app/main/default/classes/*Test*",
        "force-app/main/default/objects/**",
        "sfdx-project.json"
    ],
    "verification": {
        "testClassNamePatterns": [
            ".*CalculatorTest.*"
        ],
        "pathPatterns": [
            "**verify_pack**"
        ],
    }
}
```

You may find more information regarding the `devskiller.json` descriptor in our
[documentation](https://devskiller.zendesk.com/hc/en-us/articles/360019530419-Programming-task-project-descriptor).

## Automatic verification with verification tests

The solution submitted by the candidate may be verified using automated tests.
You’ll just have to define which tests should be treated as verification tests.

All files classified as verification tests will be removed from the project
prior to inviting the candidate.

To define verification tests, you need to set two configuration properties in
`devskiller.json`:

- `testClassNamePatterns` - an array of RegEx patterns which should match all the
  names of the verification tests.
- `pathPatterns` - an array of GLOB patterns which should match all the files
  containing verification tests. All the files that match defined patterns will
  be deleted from candidates' projects and will be added to the projects during
  the verification phase. These files will not be visible to the candidate during
  the test.
