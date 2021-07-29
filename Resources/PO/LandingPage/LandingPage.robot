*** Settings ***
Library    SeleniumLibrary
Resource    /PO/LandingPage/DropDown.robot

*** Variables ***
${SITE_NAME_ELEMENT} =    id:site-name
${CLOSE_AUTOMATION_POPUP_BTN} =    id:at-cv-lightbox-close

*** Keywords ***
Navigate To
    [Arguments]    ${URL}
    go to    ${URL}

Close Automation Message PopUp
    click element    ${CLOSE_AUTOMATION_POPUP_BTN}

Validate Page Loaded
    wait until page contains element  ${SITE_NAME_ELEMENT}

Validate PopUp Appears
    wait until element is visible    ${CLOSE_AUTOMATION_POPUP_BTN}

Go to Input Forms
    DropDown.Click on dropdown menu element    input_forms
    DropDown.Click Input Forms option    input_form_submit