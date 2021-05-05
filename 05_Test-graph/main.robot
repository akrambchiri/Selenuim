*** Settings ***
Library  SeleniumLibrary

Resource  ../Ressources/common.robot
Resource  ../Ressources/PO/sp.robot
Resource  ../Ressources/PO/partner.robot
Resource  ../Ressources/PO/customer.robot

Suite Setup  common.Begin Web Test
Suite Teardown  common.End Web Test

*** Test Cases ***
Capture graph service provider level
    [Tags]  cap_sp
    sp.charger la page web
    sp.login service provider level
    Set Selenium Speed    0.6s
    sp.open monitoring
    sp.take basic screenshots
    sp.take all screenshots
    sp.logout service provider level

Capture graph partner level
    [Tags]  cap_par
    partner.charger la page web
    partner.login partner level1
    Set Selenium Speed    0.6s
    partner.open monitoring
    partner.take basic screenshots
    partner.take all screenshots
    partner.logout partner level

login customer
    [Tags]  login_cus
    [Template]  customer.Test two login scenarios customers
    ${another_login_customer}
    ${first_login_customer}

Capture graph customer level
    [Tags]  cap_cus
    Set Selenium Speed    0.6s
    customer.open monitoring
    customer.take basic overlay screenshots
    customer.take all overlay screenshots
    customer.move to site graph
    customer.take basic sites screenshots
    customer.take all sites screenshots
    customer.logout customer level