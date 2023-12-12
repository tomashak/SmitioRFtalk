*** Settings ***
Library  Collections
Library  String
Library  JSONLibrary
Library  Libraries/excel_to_json_convertor.py
Library  Libraries/jsonLibrary.py
Test Timeout
Force Tags  sss

*** Test Cases ***
# Test Case 1: Verifying Addition
Verify Addition Result
    [Tags]
    [Documentation]    Test verifies the correctness of the addition operation.
    ${result}=    Add Numbers    10    5
    Should Be Equal As Numbers    ${result}    15

# Test Case 2: Checking List Length
Check List Length
    [Tags]  
    [Documentation]    Test checks if the length of the list is as expected.
    @{my_list}=    Create List    Item1    Item2    Item3
    ${length}=    Get List Length    ${my_list}
    Should Be Equal As Numbers    ${length}    3
    


*** Keywords ***
# Keyword 1: Add Numbers
Add Numbers
    [Documentation]    Adds two numbers and returns the result.
    [Arguments]    ${num1}    ${num2}
    ${result}=    Evaluate    ${num1} + ${num2}
    [Return]    ${result}

# Keyword 2: Get List Length
Get List Length
    [Documentation]    Returns the length of the provided list.
    [Arguments]    @{input_list}
    ${length}=    Get Length    ${input_list}
    [Return]    ${length}

# Keyword 3: Concatenate Strings
Concatenate Strings
    [Documentation]    Concatenates two strings with a specified separator.
    [Arguments]    ${str1}    ${str2}    ${separator}
    ${result}=    Set Variable    ${str1}${separator}${str2}
    [Return]    ${result}
