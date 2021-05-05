*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  OperatingSystem
Library  BuiltIn
Resource  variables.robot

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window
    Set Window Size  1600  1200

End Web Test
    #${DATE} =  Get Current Date  result_format=%d.%m.%Y %H:%M
    #Create Directory  ${PATH_TO_DIRECTORY}${DATE}
    #Set Screenshot Directory    Screenshots
    #Move Files  ./screeshots/*  ${PATH_TO_DIRECTORY}${DATE}
    Close Browser