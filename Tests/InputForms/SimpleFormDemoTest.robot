*** Settings ***
Documentation    This demo suite provides test cases for the Simple Form Demo
...    on Selenium Easy Test webpage.

Resource    ../../Resources/CommonWeb.robot
Resource    ../../Resources/SeleniumApp.robot
Resource    ../../Resources/PO/SimpleForm/SimpleFormDemo.robot

Test Setup  Begin Web Test
Test Teardown    End Web Test
*** Variables ***
${TEST_DATA_PATH} =    InputForms\\SimpleFormDemo

*** Test Cases ***
SFD_001 - Single Input Field displays user input in Your Message label
    [Documentation]  Validate input provided by user inside Single Input Field's Text Area
    ...    is displayed in "Your Message" label.
    [Tags]    SFD    1
    ${Input_text_data} =    CommonWeb.Get Test Data    ${TEST_DATA_PATH}
    SeleniumApp.Go to "Selenium Easy Test" Landing Page
    LandingPage.Close Automation Message PopUp
    LandingPage.Validate Page Loaded
    LandingPage.Go to "Simple Form Demo" Page
    SimpleFormDemo.Input Text in User Message Text Area    ${Input_text_data}

SFD_002 - Two Input Fields Displays Expected Resutl on Input
    [Documentation]    Validate NaN message is displayed on Total Label when non numeric
    ...    values are inputed. And a + b is displayed on numeric inputs a and b.
    [Tags]    SFD    2
    ${Input_values} =    CommonWeb.Get Test Data    ${TEST_DATA_PATH}
    SeleniumApp.Go to "Selenium Easy Test" Landing Page
    LandingPage.Close Automation Message PopUp
    LandingPage.Validate Page Loaded
    LandingPage.Go to "Simple Form Demo" Page
    SimpleFormDemo.Input Data Into Two Input Fields    ${Input_values}
