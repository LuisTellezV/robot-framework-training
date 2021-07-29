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
Test Demo Name
    SeleniumApp.Navigate to "Selenium Easy Test" landing page
    LandingPage.Close Automation Message PopUp
    LandingPage.Validate Page Loaded
    LandingPage.Click on Input Forms from dropdown
    LandingPage.Click on Input Form Submit option
    InputFormSubmit.Validate "Input Form Submit" page loaded
    sleep    5s