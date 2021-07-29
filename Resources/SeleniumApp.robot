*** Settings ***
Resource    PO/LandingPage.robot
Resource    ../Data/InputData.robot

*** Variables ***


*** Keywords ***
Navigate to "Selenium Easy Test" landing page
    [Documentation]
    ...     This Keyword reaches our Landing Page, and verifies that the PopUp Appears whenever it enters
    ...     to the website
    LandingPage.Navigate To    ${BASE_URL}
    LandingPage.Validate PopUp Appears

