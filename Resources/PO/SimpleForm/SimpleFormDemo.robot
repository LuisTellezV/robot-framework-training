*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Data/InputData.robot

*** Variables ***
${SIMPLE_FORM_DEMO_LINK} =    css=ul[class*='nav'] li > a[href='./basic-first-form-demo.html']
${PANEL_HEADING} =    xpath=//div[contains(text(), 'Single')]
${DROPDOWN_MENU} =    xpath=//*[@id="navbar-brand-centered"]/ul[1]/li[1]/ul
${USER_MESSAGE_TEXT_AREA} =    css=#get-input #user-message
${SHOW_MESSAGE_BUTTON} =    xpath=//*[@id="get-input"]/button

*** Keywords ***
Go to "Simple Form Demo" Page
    [Documentation]
    ...    This Keyword navigates to "Simple Form Demo" and validates the page loaded.
    click element    ${INPUT_FORMS_DROPDOWN}
    wait until element is visible    ${DROPDOWN_MENU}
    click link    ${SIMPLE_FORM_DEMO_LINK}
    wait until page contains    Single Input Field

Input Text in User Message Text Area
    [Documentation]
    ...    This Keyword inputs text into Text Area and validate the message label displays it.
    [Arguments]    ${Input_Text}
    FOR    ${Row}    IN    @{Input_Text}
        input text    ${USER_MESSAGE_TEXT_AREA}    ${Row}
        click element    ${SHOW_MESSAGE_BUTTON}
        run keyword and continue on failure    wait until page contains    ${Row}
    END