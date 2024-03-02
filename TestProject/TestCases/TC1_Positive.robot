*** Settings ***
Library  SeleniumLibrary
Resource  ../ObjectRepository/ObjectRepo.robot


*** Variables ***
${BROWSER}    Chrome
${URL}        https://todomvc.com/examples/react/dist/


*** Test Cases ***
Verify Adding a ToDo Item
    [Documentation]    Validate that a to-do item can be added
    [Tags]  Positive
    create webdriver    Chrome  executable_path="/Users/monalisanayak/Documents/chromedriver_mac_arm64/chromedriver.exe"
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

     # Perform actions to add a new to do
    Create ToDo Item  Test1

   # Validate the added element
    Validate ToDo Item  ${added_element_locator}

Validate Product Listing
    [Documentation]    Validate that a newly added to do is listed under active tab
    [Tags]  Positive
    #steps to navigate to the active tab where newly added to-do are listed
    click Element    ${active_tab_locator}

    # Validation of the element to be visible
    Element Should Be Visible    ${added_element_locator}

    #Navigate to all tab
    click element  ${all_tab_locator}

    #validate whether the to do item is listed under all tab
    element should be visible  ${added_element_locator}


Verify added item and can be checked
    [Documentation]    Validate that added to do can be selected
    [Tags]  Positive
    # clicking on the checkbox of the item added
    click element   ${todo_item_checkbox_locator}

    # navigating to completed tab
    click element   ${completed_tab_locator}
    sleep  2s

    #Validating completed list shows the same item which was checked as complete
    ${actual_value}    Set Variable    Test1!
    Should Be Equal    ${actual_value}    Test1!

    #Navigate to active tab
    click element   ${active_tab_locator}

    #validate the item which is completed should not be listed under active
    element should not be visible  ${added_element_locator}

Verify Clearing Completed Tasks
    [Documentation]    Validate the clear completed would wipe out all the completed task and completed task would be empty
    [Tags]  Positive
    # clicking on clear completed button
    click element  ${clear_completed_tab_locator}
    sleep  2s

    #validating no item should be under completed task
    element should not be visible  ${completed_tab_locator}

    #validating no item should be under active tab
    element should not be visible   ${todo_item_list_view_locator}

    #validate the list is containg zero item
    ${itemCount}=    Get Element Count      ${todo_element_count_locator}
    Should Be Equal As Numbers    ${itemCount}    0

Verify edit action on added item
    [Documentation]    Validate the edit functionality when double click on the item
    [Tags]  Positive
    # Perform actions to add a new to do
    Create ToDo Item    test1

    #navigating to all tab
    click element       ${all_tab_locator}

    #validate added item should be visible under all tab
    Element Should Be Visible    ${added_element_locator}

    #double tab on the item to edit
    Double Click Element    ${added_element_locator}

    #Clear the field to enter the new name
    Press Keys      ${todo_element_edit_field_locator}     BACKSPACE   ENTER

    Close Browser

*** Keywords ***

Create ToDo Item
    [Arguments]  ${item}
    click element          ${input_field_locator}
    input text             ${input_field_locator}  ${item}
    Press Keys             ${input_field_locator}  ENTER
    Sleep                  5s

Validate ToDo Item
    [Arguments]  ${locator}
    Element Should Be Visible  ${locator}