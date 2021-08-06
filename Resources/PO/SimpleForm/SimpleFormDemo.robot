*** Settings ***
Library    SeleniumLibrary
Library    ../../../CustomLibs/input_data_verifier.py

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
Input Text in User Message Text Area
    [Documentation]
    ...    This Keyword inputs text into Text Area and validate the message label displays it.
    [Arguments]    ${Input_Text}
    FOR    ${Row}    IN    @{Input_Text}
        input text    ${USER_MESSAGE_TEXT_AREA}    ${Row}
        click element    ${SHOW_MESSAGE_BUTTON}
        run keyword and continue on failure    wait until page contains    ${Row}
    END

Input Data Into Two Input Fields
    [Documentation]
    ...    This Keyword inputs invalid text into Two Input Files Text Areas and validate
    ...    NaN is displayed in Total Label.
    [Arguments]    ${Input_Text}
    FOR    ${CSV_Row}    IN    @{Input_Text}
        ${Expected_Output} =   get expected output    ${CSV_Row[0]}    ${CSV_Row[1]}
        input text    ${SUM_A}    ${CSV_Row[0]}
        input text    ${SUM_B}    ${CSV_Row[1]}
        click element    ${GET_TOTAL_BUTTON}
        run keyword and continue on failure    wait until page contains    ${Expected_Output}
    END
