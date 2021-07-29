*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../../../Resources/CommonWeb.robot

*** Variables ***
${ELEMENT} =    class:lskjdfalkdsjf
${ROW} =    0
${TEST_DATA_PATH}

&{TEXTBOX_ELEMENT_TO_TYPE}
    ...    first_name=name:first_name
    ...    last_name=name:last_name
    ...    email=name:email
    ...    phone=name:phone
    ...    address=name:address
    ...    city=name:city
    ...    zip_code=name:zip
    ...    website=name:website
    ...    project_desc=name:comment

&{RADIO_BUTTONS_OBJECTS}
    ...    radio_btn=css:input[value='option']

&{CLICKABLE_OBJECTS}
    ...    state=name:state
    ...    state_option=xpath://option[contains(text(), 'state')]

&{CLICKABLE_BUTTONS}
    ...    send_btn=xpath://button[@type='submit'and contains(text(), 'Send')]

&{GET_TEXT_ELEMENTS}
    ...    site_title=xpath://h2[contains(text(), 'Input form with validations')]
    ...    your_msg_print=css:span#display
    ...    sum_print=css:span#displayvalue

${DISABLED_SEND_BTN} =    xpath=//button[@type='submit' and @disabled='disabled' and contains(text(), 'Send')]

&{ERROR_MSG_ELEMENTS}
    ...    first_name=xpath://small[contains(text(), 'your first name')]
    ...    last_name=xpath://small[contains(text(), 'your last name')]
    ...    email=xpath://small[contains(text(), 'your email')]
    ...    phone=xpath://small[contains(text(), 'your phone')]
    ...    street=xpath://small[contains(text(), 'your street')]
    ...    city=xpath://small[contains(text(), 'your city')]
    ...    state=xpath://small[contains(text(), 'your state')]
    ...    zip_code=xpath://small[contains(text(), 'your zip code')]
    ...    description=xpath://small[contains(text(), 'description')]


*** Keywords ***
Fill Multiple Input Forms dynamically
    [Arguments]    ${QUANTITY}

    CommonWeb.Create Test Data    ${TEST_DATA_PATH}    input_form_submit    ${QUANTITY}
    ${DATA_FILE_CSV} =    CommonWeb.Get Test Data    ${TEST_DATA_PATH}
    ${LENGTH} =    get length    ${DATA_FILE_CSV}
    FOR    ${ROW}    IN RANGE    ${LENGTH}
        reload page
        Fill Input Form    ${ROW}
        Click on Send Button
    END

Fill Multiple Input Forms statically
    ${DATA_FILE_CSV} =    CommonWeb.Get Test Data    ${TEST_DATA_PATH}
    ${LENGTH} =    get length    ${DATA_FILE_CSV}
    FOR    ${ROW}    IN RANGE    ${LENGTH}
        reload page
        Fill Input Form    ${ROW}
        Click on Send Button
    END

Fill Input Form
    [Arguments]    ${ROW}
    ${DATA_FILE_CSV} =    CommonWeb.Get Test Data  ${TEST_DATA_PATH}

    Input Text into Element    first_name    ${DATA_FILE_CSV[${ROW}]}    0
    Input Text into Element    last_name    ${DATA_FILE_CSV[${ROW}]}    1
    Input Text into Element    email    ${DATA_FILE_CSV[${ROW}]}    2
    Input Text into Element    phone    ${DATA_FILE_CSV[${ROW}]}    3
    Input Text into Element    address    ${DATA_FILE_CSV[${ROW}]}    4
    Input Text into Element    city    ${DATA_FILE_CSV[${ROW}]}    5
    Select State    ${DATA_FILE_CSV[${ROW}]}    6
    Input Text into Element    zip_code    ${DATA_FILE_CSV[${ROW}]}    7
    Input Text into Element    website    ${DATA_FILE_CSV[${ROW}]}    8
    Select Radio button option    ${DATA_FILE_CSV[${ROW}]}    9
    Input Text into Element    project_desc    ${DATA_FILE_CSV[${ROW}]}    10
    Reduce Zoom to view all form


Reduce Zoom to view all form
    execute javascript    document.body.style.zoom="60%"

Reset Zoom page
    execute javascript    document.body.style.zoom="100%"

Validate "Input Form Submit" page loaded
    wait until element is visible    ${GET_TEXT_ELEMENTS.site_title}    20

Input Text into Element
    [Arguments]    ${ELEMENT_TO_TYPE_IN}    ${MESSAGE}    ${ELEMENT_FROM_ROW}
    clear element text    ${TEXTBOX_ELEMENT_TO_TYPE.${ELEMENT_TO_TYPE_IN}}
    input text    ${TEXTBOX_ELEMENT_TO_TYPE.${ELEMENT_TO_TYPE_IN}}    ${MESSAGE[${ELEMENT_FROM_ROW}]}

Click on Element
    [Arguments]    ${ELEMENT_TO_CLICK}
    click element  ${CLICKABLE_OBJECTS.${ELEMENT_TO_CLICK}}

Get Text from Element
    [Arguments]    ${ELEMENT}
    ${TEXT_VALUE} =    get text    ${GET_TEXT_ELEMENTS.${ELEMENT}}
    scroll element into view    ${GET_TEXT_ELEMENTS.${ELEMENT}}
    should not be empty    ${GET_TEXT_ELEMENTS.${ELEMENT}}    Your message field is empty, please validate it has some string.
    [Return]    ${TEXT_VALUE}

Validate text result with input data
    [Arguments]    ${VALUE_1}    ${VALUE_2}    ${ELEMENT_FROM_ROW}
    ${VALUE_1} =    convert to string    ${VALUE_1}
    ${VALUE_2} =    convert to string    ${VALUE_2[${ELEMENT_FROM_ROW}]}
    should be equal    ${VALUE_1}    ${VALUE_2}    Values do not match with input data.

Select State
    [Arguments]    ${STATE}    ${ELEMENT_FROM_ROW}
    click element    ${CLICKABLE_OBJECTS.state}
    ${LOCATOR} =    convert to string    ${CLICKABLE_OBJECTS.state_option}
    ${LOCATOR} =    replace string    ${LOCATOR}    state    ${STATE[${ELEMENT_FROM_ROW}]}
    click element    ${LOCATOR}

Validate word on csv
    [Arguments]    ${WORD}    ${POSITION_ON_ROW}
    should not be empty    ${WORD}
    [Return]    True

Click on Send Button
    Reset Zoom page
    click element    ${CLICKABLE_BUTTONS.send_btn}
    Reduce Zoom to view all form

Select Radio button option
    [Arguments]    ${RADIO_BUTTON}    ${ELEMENT_FROM_ROW}
    select radio button    hosting    ${RADIO_BUTTON[${ELEMENT_FROM_ROW}]}

Validate all error messages from the form
    element should be visible    ${ERROR_MSG_ELEMENTS.first_name}
    element should be visible    ${ERROR_MSG_ELEMENTS.last_name}
    element should be visible    ${ERROR_MSG_ELEMENTS.email}
    element should be visible    ${ERROR_MSG_ELEMENTS.phone}
    element should be visible    ${ERROR_MSG_ELEMENTS.street}
    element should be visible    ${ERROR_MSG_ELEMENTS.city}
    element should be visible    ${ERROR_MSG_ELEMENTS.state}
    element should be visible    ${ERROR_MSG_ELEMENTS.zip_code}
    element should be visible    ${ERROR_MSG_ELEMENTS.description}

Validate Send Button is disabled
    element should be disabled    ${DISABLED_SEND_BTN}


