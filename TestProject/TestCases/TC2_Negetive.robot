*** Settings ***
Library  SeleniumLibrary
Resource  ../ObjectRepository/ObjectRepo.robot


*** Variables ***
${BROWSER}    Chrome
${URL}        https://todomvc.com/examples/react/dist/
${MAX_LENGTH}    200
${randomString}   ${EMPTY}


*** Test Cases ***
Verify Only Space Is Not Allowed To Create a ToDo
    [Documentation]    Validate creation of a todo item is not possible when only space is entered in input field
    [Tags]  Negetive
    create webdriver    Chrome  executable_path="/Users/monalisanayak/Documents/chromedriver_mac_arm64/chromedriver.exe"
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    5s

    #Press enter button from the keyboard
    Press Keys    ${input_field_locator}    SPACE      ENTER

Verify Adding a ToDo Item Is Not Possible When Entered One Character
    [Documentation]    Validate the minimum requirement to create a todo item is to add more than one character
    [Tags]  Negetive
    # Entering data to the input field to create to do item
    Create ToDo With Input  ${input_field_locator}     a


Verify Adding a ToDo Item Is Possible by Entering Special Characters
    [Documentation]    Validate user can create a to-do item by entering special characters
    [Tags]  Negetive
    # Entering data to the input field to create to do item
    Create ToDo With Input  ${input_field_locator}     @#$%


Validate Create ToDo Item with Long Character
    [Documentation]    Validate user can enter Input Exceeding Maximum Length
    [Tags]  Negetive

   # Entering random string of lenght 100
    ${randomString}=    Evaluate    ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(${MAX_LENGTH}))    modules=string,random

    Create ToDo With Input    ${input_field_locator}    ${randomString}
    Close Browser

*** Keywords ***
Create ToDo With Input
    [Arguments]    ${inputLocator}    ${inputData}
    Click Element    ${input_field_locator}
    Input Text    ${input_field_locator}    ${inputData}
    Press Keys    ${input_field_locator}    ENTER
    Sleep    5s
    Run Keyword If   '${inputData}' == '@#$%' or '${inputData}' == '${randomString}'    Element Should Be Visible    ${todo_list_container_locator}
    Run Keyword If   '${inputData}' == 'a'  Element Should not Be Visible    ${todo_list_container_locator}

