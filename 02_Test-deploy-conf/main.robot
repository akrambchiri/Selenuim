*** Settings ***
Library  SeleniumLibrary
Library    XML

Resource  ../Ressources/common.robot
Resource  ../Ressources/PO/sp.robot
Resource  ../Ressources/PO/partner.robot
Resource  ../Ressources/PO/customer.robot
Resource  ../Ressources/DataManager.robot
Resource  ../Data/InputData.robot

Suite Setup  common.Begin Web Test
Suite Teardown  common.End Web Test


*** Test Cases ***
charger
    [Tags]  charger
    sp.charger la page web

Login
    [Tags]  login
    [Template]  sp.Test two login scenarios
    ${another_login}
    ${first_login}


deploy pop partner controller
    [tags]  ppc
    Set Selenium Speed    0.2s
    sp.create a pop
    sp.create a partner
    sp.create controller
    sp.assign sites to partner
    sp.logout service provider level

Login Partner
    [Tags]  login_partner
    [Template]  partner.Test two login scenarios partner
    ${another_login_partner}
    ${first_login_partner}


Deploy Sites1
    [Tags]  sites
    Set Selenium Speed    0.3s
    partner.create customer
    ${sitesdata} =  DataManager.Get CSV Data    ${Sites_Path}
    partner.deploy All sites  ${sitesdata}

Logout
    [Tags]  logout
    Set Selenium Speed    0.3
    Partner.logout partner level



