*** Settings ***
Documentation    This test suite validates Input Form Submit demo
...    on Selenium Easy Test webpage
Resource    ../../Resources/SeleniumApp.robot
Resource    ../../Resources/CommonWeb.robot
Resource    ../../Resources/PO/LandingPage/LandingPage.robot
Resource    ../../Resources/PO/InputForms/InputFormSubmit.robot


Test Setup    Begin Web Test
Test Teardown    End Web Test

*** Variables ***
#This is used to locate the .csv file WHERE we will have some data that will be used on test execution...
# just an example of what it gets on this
${TEST_DATA_PATH} =    InputForms\\InputFormSubmit


*** Test Cases ***
IFS_001 - Validate all fields are filled with String values - PostiveTestCase

    CommonWeb.Get Test Data    ${TEST_DATA_PATH}

    SeleniumApp.Navigate to "Selenium Easy Test" landing page
    LandingPage.Close Automation Message PopUp
    LandingPage.Validate Page Loaded
    LandingPage.Click on Input Forms from dropdown
    LandingPage.Click on Input Form Submit option
    InputFormSubmit.Validate "Input Form Submit" page loaded

    sleep    5s


IFS_002 - Validate Please Supply your First Name error is displayed
    [Documentation]    Validate that when user doesn't provide a first name in Input Form Submit
    ...    Demo, the error "Please Supply your first name" is displayed below "First Name" field.

    SeleniumApp.Navigate to "Selenium Easy Test" landing page
    LandingPage.Close Automation Message PopUp
    LandingPage.Validate Page Loaded
    LandingPage.Click on Input Forms from dropdown
    LandingPage.Click on Input Form Submit option
    InputFormSubmit.Validate "Input Form Submit" page loaded

    InputFormSubmit.Fill Form without FirstName
    InputFormSubmit.Fill LastName
    InputFormSubmit.Fill Email

