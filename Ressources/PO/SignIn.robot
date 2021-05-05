*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SIGN_IN_EMAIL} =          xpath=//*[@id="username"]
${SIGN_IN_PASSWORD} =       xpath=//*[@id="password"]
${LOGIN_SUBMIT_BUTTON} =    xpath=//*[@id="login"]

*** Keywords ***

Enter Credentials
    [Arguments]  ${Credentials}
    Input Text  name=uname  ${Credentials.Email}
    Input Text  name=passwd  ${Credentials.Password}

Click Submit
    Click Button  ${LOGIN_SUBMIT_BUTTON}
