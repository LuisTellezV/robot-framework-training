*** Settings ***
Library  SeleniumLibrary
Resource    ../Data/InputData.robot
Resource    ../Resources/DataManager.robot

*** Variables ***

*** Keywords ***
Begin Web Test
    [Documentation]    This Keyword help us setup all our test cases dynamically
    open browser  about:blank  ${BROWSER}
    maximize browser window

End Web Test
    close all browsers

Get Test Data
    [Arguments]    ${DIRECTORY_NAME}
    ${PATH} =    Get Path for Test Data File    ${DIRECTORY_NAME}    ${TEST_NAME}
    ${SIMPLE_FORM_DATA} =    DataManager.Get CSV Data    ${PATH}
    [Return]    ${SIMPLE_FORM_DATA}

