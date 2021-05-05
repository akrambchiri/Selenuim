*** Settings ***
Library  ../CustomLibs/Csv.py

*** Keywords ***
Get CSV Data
    [Arguments]  ${FilePath}
    ${Data} =  read_csv_file    ${FilePath}
    [Return]  ${Data}