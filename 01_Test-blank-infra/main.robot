*** Settings ***
Library     SeleniumLibrary  timeout=10s
Library     SSHLibrary
Resource    ../Ressources/Blank/infra.robot

*** Test Cases ***
blank infra
    infra.blank devices
    Set Selenium Speed    15s
    infra.blank director
    infra.blank controller

