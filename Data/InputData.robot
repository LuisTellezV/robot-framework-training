*** Settings ***
Library    String
Library    ../CustomLibs/csv_code.py

*** Variables ***
# Configuration
${BROWSER} =    chrome
${BASE_URL} =    https://www.seleniumeasy.com/test/
${INPUT_FORMS_DROPDOWN} =    //*[@id="navbar-brand-centered"]/ul[1]/li[1]/a
${SIMPLE_FORM_DEMO_LINK} =    css=ul[class*='nav'] li > a[href='./basic-first-form-demo.html']
${DROPDOWN_MENU} =    xpath=//*[@id="navbar-brand-centered"]/ul[1]/li[1]/ul

*** Keywords ***
Get Path for Test Data File
    [Arguments]    ${PATH_TO_POM}    ${TEST_NAME}=${None}
    ${TEST_NAME} =    replace string    ${TEST_NAME}  ${space}  _
    ${TEST_DATA_PATH} =    catenate    SEPARATOR=    ${CURDIR}\\${PATH_TO_POM}\\${TEST_NAME}.csv
    [Return]    ${TEST_DATA_PATH}
