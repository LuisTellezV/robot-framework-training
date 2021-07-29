*** Settings ***
Library    SeleniumLibrary

*** Variables ***
&{TEXTBOX_ELEMENT_TO_TYPE}
    ...    your_message=css:input#user-message
    ...    sum_value_1=css:input#sum1
    ...    sum_value_2=css:input#sum2
&{CLICKABLE_OBJECTS}
    ...    show_msg=css:form#get-input>button
    ...    get_total=css:form#gettotal>button
&{GET_TEXT_ELEMENTS}
    ...    your_msg_print=css:span#display
    ...    sum_print=css:span#displayvalue

*** Keywords ***
Fill "Your Message" Single Input Field
    [Arguments]    ${DATA_FILE_CSV}
    ${LENGTH} =    get length    ${DATA_FILE_CSV}
    FOR    ${ROW}    IN RANGE    ${LENGTH}
        reload page
        Verify simple form demo page loaded
        Input Text into Element    your_message    ${DATA_FILE_CSV[${ROW}]}    0
        Click on Element    show_msg
        ${VALIDATION} =    Get Text from Element    your_msg_print
        Validate text result with input data    ${VALIDATION}    ${DATA_FILE_CSV[${ROW}]}    0
    END

Fill Two Input Fields
    [Arguments]    ${DATA_FILE_CSV}
    ${LENGTH} =    get length    ${DATA_FILE_CSV}
    FOR    ${ROW}    IN RANGE    ${LENGTH}
        reload page
        Verify simple form demo page loaded
        Input Text into Element    sum_value_1    ${DATA_FILE_CSV[${ROW}]}    0
        Input Text into Element    sum_value_2    ${DATA_FILE_CSV[${ROW}]}    1
        Click on Element    get_total
        ${VALIDATION} =    Get Text from Element    sum_print
        Validate text result with input data    ${VALIDATION}    ${DATA_FILE_CSV[${ROW}]}    2
    END

Verify simple form demo page loaded
    [Documentation]    This Keyword verifies that our demo page loaded correctly by looking for an element
    ...    that will be present in the site always. Once it finds it it will print a msg that Demo Page
    ...    Loaded Correctly.

    wait until element is visible    ${TEXTBOX_ELEMENT_TO_TYPE.your_message}
    log    Demo Page Loaded Correctly

Input Text into Element
    [Documentation]    This Keyword inputs some text message into an element that is passed as a parameter of
    ...    this Keyword.
    ...
    ...    This Keyword receives 2 parameters: ELEMENT_TO_TYPE_IN and MESSAGE
    ...
    ...    Args:
    ...         ${ELEMENT_TO_TYPE_IN}: Element name that we can look in our dictionary &{TEXTBOX_ELEMENT_TO_TYPE}
    ...         directly, in order to just call it from there dynamically.
    ...         ${MESSAGE}: Text that will be added into the Element parsed.

    [Arguments]    ${ELEMENT_TO_TYPE_IN}    ${MESSAGE}    ${ELEMENT_FROM_ROW}
    #scroll element into view    ${TEXTBOX_ELEMENT_TO_TYPE.${ELEMENT_TO_TYPE_IN}}
    clear element text    ${TEXTBOX_ELEMENT_TO_TYPE.${ELEMENT_TO_TYPE_IN}}
    input text    ${TEXTBOX_ELEMENT_TO_TYPE.${ELEMENT_TO_TYPE_IN}}    ${MESSAGE[${ELEMENT_FROM_ROW}]}

Click on Element
    [Arguments]    ${ELEMENT_TO_CLICK}
    click element  ${CLICKABLE_OBJECTS.${ELEMENT_TO_CLICK}}

Get Text from Element
    [Arguments]    ${ELEMENT}
    ${TEXT_VALUE}    get text    ${GET_TEXT_ELEMENTS.${ELEMENT}}
    scroll element into view    ${GET_TEXT_ELEMENTS.${ELEMENT}}
    should not be empty    ${GET_TEXT_ELEMENTS.${ELEMENT}}    Your message field is empty, please validate it has some string.
    [Return]    ${TEXT_VALUE}

Validate text result with input data
    [Arguments]    ${VALUE_1}    ${VALUE_2}    ${ELEMENT_FROM_ROW}
    ${VALUE_1} =    convert to string    ${VALUE_1}
    ${VALUE_2} =    convert to string    ${VALUE_2[${ELEMENT_FROM_ROW}]}
    should be equal    ${VALUE_1}    ${VALUE_2}    Values do not match with input data.
