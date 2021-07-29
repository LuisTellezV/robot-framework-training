*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../../../Resources/CommonWeb.robot

*** Variables ***
${SITE_TITLE} =    xpath://h2[contains(text(), 'Input form with validations')]

*** Keywords ***
Validate "Input Form Submit" page loaded
    wait until element is visible    ${SITE_TITLE}


