*** Settings ***
Library  Collections
Library  String
Library  JSONLibrary
Library  Libraries/excel_to_json_convertor.py
Library  Libraries/jsonLibrary.py
Documentation   Lorem ipsum
Metadata  Author  Tomas Hak
Metadata  Confluence  https://confluence.company.cz/namepage
Metadata  Priority   High
Variables  Data/file.json

*** Variables ***


*** Test Cases ***
# Test Case 1: Verifying Addition
Verify Addition Result
    [Tags]  123456  CB:123
    [Documentation]    Test verifies the correctness of the addition operation.
    Import Variables  ${CURDIR}/Data/myvariable.yaml
    log  ${length_residual_road}
    ${result}=    Add Numbers    10    5
    Should Be Equal As Numbers    ${result}    15

# Test Case 2: Checking List Length
Check List Length
    [Tags]  CB:124
    [Documentation]    Test checks if the length of the list is as expected.
    @{my_list}=    Create List    Item1    Item2    Item3
    ${length}=    Get List Length    ${my_list}
    Should Be Equal As Numbers    ${length}    3
    
Example Test
    [Tags]  loglevel
    Set Log Level    INFO    # Nastaví úroveň záznamu na INFO
 
    Log    This is an INFO message
    Log    This is another INFO message
    Log    This is a DEBUG message    level=DEBUG
    Log    This is a TRACE message    level=TRACE
    Log    This is a WARN message    level=WARN
    Log    This is a ERROR message    level=ERROR
 
    Set Log Level    NONE    # Nastaví úroveň záznamu na TRACE
  
    Log    This is an INFO message 2    
    Log    This is a DEBUG message 2    level=DEBUG
    Log    This is a TRACE message 2    level=TRACE
    Log    This is a WARN message 2    level=WARN
    Log    This is a ERROR message 2    level=ERROR


Excel to Json
    [Tags]  excel
    ${excel_json} =  Excel To Json Convertor  Data/input.xls

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
