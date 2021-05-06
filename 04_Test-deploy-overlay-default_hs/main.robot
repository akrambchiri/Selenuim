*** Settings ***
Library  SeleniumLibrary

Resource  ../Ressources/common.robot
Resource  ../Ressources/PO/sp.robot
Resource  ../Ressources/PO/partner.robot
Resource  ../Ressources/PO/customer.robot

Suite Setup  common.Begin Web Test
Suite Teardown  common.End Web Test

*** Test Cases ***
login
    partner.charger la page web
    partner.login partner level1

Deploy overlay default hs
    Set Selenium Speed    0.1s
    partner.deploy default hs overlay