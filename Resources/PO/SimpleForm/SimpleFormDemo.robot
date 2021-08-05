*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Data/InputData.robot

*** Variables ***
${SIMPLE_FORM_DEMO_LINK} =    css=ul[class*='nav'] li > a[href='./basic-first-form-demo.html']
${PANEL_HEADING} =    xpath=//div[contains(text(), 'Single')]
${DROPDOWN_MENU} =    xpath=//*[@id="navbar-brand-centered"]/ul[1]/li[1]/ul
${USER_MESSAGE_TEXT_AREA} =    css=#get-input #user-message
${SHOW_MESSAGE_BUTTON} =    xpath=//*[@id="get-input"]/button
${SUM_A} =    css=input[id=sum1]
${SUM_B} =    css=input[id=sum2]
${GET_TOTAL_BUTTON} =    xpath=//button[contains(text(), 'Get Total')]
${TOTAL_LABEL} =   xpath=//label[contains(text(), 'Total')]

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

Input Invalid Data Into Two Input Fields
    [Documentation]
    ...    This Keyword inputs invalid text into Two Input Files Text Areas and validate
    ...    NaN is displayed in Total Label.
    [Arguments]    ${Input_Text}
    FOR    ${Row}    IN    @{Input_Text}
        input text    ${SUM_A}
        input text    ${SUM_B}    ${Row[1]}
        click element    ${GET_TOTAL_BUTTON}
        run keyword and continue on failure    wait until page contains    NaN
    END

# ${In_a} =    convert to number    ${Row[0]}
#        ${In_b} =    convert to number    ${Row[1]}
#        ${Total} =      evaluate    ${In_a} + ${In_b}