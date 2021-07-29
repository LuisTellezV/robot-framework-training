*** Settings ***
Documentation    Use this layer to get data from external files
Library    ../CustomLibs/csv_code.py

*** Keywords ***
Get CSV Data
    [Arguments]    ${FILE_PATH}
    ${Data} =    read csv file    ${FILE_PATH}
    [Return]    ${Data}
