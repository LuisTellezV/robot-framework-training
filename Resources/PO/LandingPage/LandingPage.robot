*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SITE_NAME_ELEMENT} =    id:site-name
${CLOSE_AUTOMATION_POPUP_BTN} =    id:at-cv-lightbox-close
${INPUT_FORMS_OPTION} =    xpath:(//li/a[contains(text(), 'Input Forms')])[1]
${INPUT_FORM_SUBMIT_SECTION} =    link:Input Form Submit

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

Click on Input Forms from dropdown
    click element    ${INPUT_FORMS_OPTION}

Click on Input Form Submit option
    click link    ${INPUT_FORM_SUBMIT_SECTION}
