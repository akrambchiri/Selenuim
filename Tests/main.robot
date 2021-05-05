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
    sp.charger la page web
    sp.login service provider level
    Set Selenium Speed    1s
    sp.open monitoring
    sp.define filter
    sp.take screenshot appvolumeperoverlay
    sp.take screenshot topprotocolsvolume
    sp.take screenshot topsite
    sp.take screenshot toplantakers
    sp.take screenshot toplanlisteners
    sp.take screenshot overlaybandwidthusage
    sp.take screenshot wanperoverlayvolume
    sp.logout service provider level

Capture graph partner level
    #partner.charger la page web
    partner.login partner level1
    Set Selenium Speed    1s
    partner.open monitoring
    partner.define filter
    partner.take screenshot appvolumeperoverlay
    partner.take screenshot topprotocolsvolume
    partner.take screenshot topsite
    partner.take screenshot toplantakers
    partner.take screenshot toplanlisteners
    partner.take screenshot overlaybandwidthusage
    partner.take screenshot wanperoverlayvolume
    partner.logout partner level

Capture graph customer level
    [tags]  test
    customer.charger la page web
    customer.login customer level
    Set Selenium Speed    1s
    customer.open monitoring
    customer.define filter
    #customer.take screenshot overlay appvolumeperoverlay
    #customer.take screenshot overlay topprotocolsvolume
    #customer.take screenshot overlay topsite
    #customer.take screenshot overlay toplantakers
    #customer.take screenshot overlay toplanlisteners
    #customer.take screenshot overlay overlaybandwidthusage
    #customer.take screenshot overlay wanperoverlayvolume
    customer.move to site graph
    customer.take screenshot site bandwidthusage
    customer.take screenshot site wanlink
    customer.take screenshot site topapplicationvolume
    customer.take screenshot site topprotocolevolume
    customer.take screenshot site toplantakers
    customer.take screenshot site toplanlistemers
    customer.take screenshot site tcpthroughput
    customer.logout customer level