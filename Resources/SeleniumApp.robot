*** Settings ***
Resource    PO/LandingPage/LandingPage.robot
Resource    ../Data/InputData.robot

*** Variables ***


*** Keywords ***
Go to "Selenium Easy Test" Landing Page
    [Documentation]
    ...     This Keyword reaches our Landing Page, and verifies that the PopUp Appears whenever it enters
    ...     to the website
    LandingPage.Navigate To    ${BASE_URL}
    LandingPage.Validate PopUp Appears
