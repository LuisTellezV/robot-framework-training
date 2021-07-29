*** Settings ***
Library    SeleniumLibrary

*** Variables ***
&{DROPDOWN_CLICKABLE_OBJECTS}
    ...    input_forms=xpath:(//li/a[contains(text(), 'Input Forms')])[1]
    ...    date_pickers=xpath:(//li/a[contains(text(), 'Date pickers')])[1]
    ...    table=xpath:(//li/a[contains(text(), 'Table')])[1]
    ...    progress_bars=xpath:(//li/a[contains(text(), 'Progress Bars')])[1]
    ...    alerts_and_modals=xpath:(//li/a[contains(text(), 'Alerts & Modals')])[1]
    ...    list_box=xpath:(//li/a[contains(text(), 'List Box')])[1]
    ...    others=xpath:(//li/a[contains(text(), 'Others')])[1]

&{INPUT_FORMS_CLICKABLE_OBJECTS}
    ...    simple_form=link:Simple Form Demo
    ...    check_box=link:Checkbox Demo
    ...    radio_buttons=link:Radio Buttons Demo
    ...    select_dropdown=link:Select Dropdown List
    ...    input_form_submit=link:Input Form Submit
    ...    ajax_form_submit=link:Ajax Form Submit
    ...    jquery_select_dropdown=link:JQuery Select dropdown

&{DATE_PICKERS_CLICKABLE_OBJECTS}
    ...    bootstrap=link:Bootstrap Date Picker
    ...    jquery=link:JQuery Date Picker

&{TABLE_CLICKABLE_OBJECTS}
    ...    pagination=link:Table Pagination
    ...    data_search=link:Table Data Search
    ...    filter=link:Table Filter
    ...    sort_and_search=link:Table Sort & Search
    ...    data_download=link:Data Download

&{PROGRESS_BARS_CLICKABLE_OBJECTS}
    ...    jquery_download=link:JQuery Download Progress bars
    ...    bootstrap_progress=link:Bootstrap Progress bar
    ...    drag_and_drop=link:Drag & Drop Sliders

&{ALERTS_AND_MODALS_CLICKABLE_OBJECTS}
    ...    bootstrap_alerts=link:Bootstrap Alerts
    ...    bootstrap_modals=link:Bootstrap Modals
    ...    window_popup_modal=link:Window Popup Modal
    ...    progress_bar_modal=link:Progress Bar Modal
    ...    javascript_alerts=link:Javascript Alerts
    ...    file_download=link:File Download

&{LIST_BOX_CLICKABLE_OBJECTS}
    ...    bootstrap_list=link:Bootstrap List Box
    ...    jquery_list=link:JQuery List Box
    ...    data_list=link:Data List Filter

&{OTHERS_CLICKABLE_OBJECTS}
    ...    drag_and_drop=link:Drag and Drop
    ...    dynamic_data=link:Dynamic Data Loading
    ...    charts_demo=link:Charts Demo

*** Keywords ***
Click on dropdown menu element
    [Arguments]    ${ELEMENT_TO_CLICK}
    click element    ${DROPDOWN_CLICKABLE_OBJECTS.${ELEMENT_TO_CLICK}}

Click Input Forms option
    [Arguments]    ${ELEMENT_TO_CLICK}
    click link    ${INPUT_FORMS_CLICKABLE_OBJECTS.${ELEMENT_TO_CLICK}}

Click Date Pickers option
    [Arguments]    ${ELEMENT_TO_CLICK}
    click link    ${DATE_PICKERS_CLICKABLE_OBJECTS.${ELEMENT_TO_CLICK}}

Click Progress Bars option
    [Arguments]    ${ELEMENT_TO_CLICK}
    click link    ${PROGRESS_BARS_CLICKABLE_OBJECTS.${ELEMENT_TO_CLICK}}

Click Alerts and Modals option
    [Arguments]    ${ELEMENT_TO_CLICK}
    click link    ${ALERTS_AND_MODALS_CLICKABLE_OBJECTS.${ELEMENT_TO_CLICK}}

Click on List Box option
    [Arguments]    ${ELEMENT_TO_CLICK}
    click link    ${LIST_BOX_CLICKABLE_OBJECTS.${ELEMENT_TO_CLICK}}

Click Others option
    [Arguments]    ${ELEMENT_TO_CLICK}
    click link    ${OTHERS_CLICKABLE_OBJECTS.${ELEMENT_TO_CLICK}}

Click Table option
    [Arguments]    ${ELEMENT_TO_CLICK}
    click link    ${TABLE_CLICKABLE_OBJECTS.${ELEMENT_TO_CLICK}}