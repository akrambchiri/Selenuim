*** Settings ***
Library           SeleniumLibrary
Resource    ../variables.robot
Resource    ../PO/SignIn.robot
Resource    ../DataManager.robot

*** Keywords ***
Test two login scenarios partner
    [Arguments]  ${Credentials}
    partner.Attempt Login  ${Credentials}

Attempt Login
    [Arguments]  ${Credentials}
    Wait Until Page Contains Element    ${SIGN_IN_EMAIL}
    SignIn.Enter Credentials  ${Credentials}
    ${pwd} =  Get Value    //*[@id="password"]
    SignIn.Click Submit
    IF    '${pwd}' == 'Adminpap01!'
         partner.change default password
    END

charger la page web
    Go To    ${DIRECTOR_URL}
    Click Element    id=details-button
    Click Element    id=proceed-link
    Wait Until Page Contains    Login

login partner level
    Clear Element Text    name=uname
    Input Text    name=uname    ${PARTNER_LOGIN}
    Clear Element Text    name=passwd
    Input Text    name=passwd    ${PARTNER_PASSWORD}
    Click Element    xpath=//*[@id="login"]

login partner level1
    Clear Element Text    name=uname
    Input Text    name=uname    ${PARTNER_LOGIN}
    Clear Element Text    name=passwd
    Input Text    name=passwd    ${NEW_PARTNER_PASSWORD}
    Click Element    xpath=//*[@id="login"]

change default password
    Click Element    //*[@id="change_passwd_modal"]/div/div/div[2]/h5/a
    Wait Until Page Contains    Old Password
    #Clear Element Text    id=myPro_oldpasswd
    Input Text    id=myPro_oldpasswd    ${PARTNER_PASSWORD}
    Clear Element Text    id=myPro_passwd
    Input Text    id=myPro_passwd    ${NEW_PARTNER_PASSWORD}
    Clear Element Text    id=myPro_confirmPasswd
    Input Text    id=myPro_confirmPasswd    ${NEW_PARTNER_PASSWORD}
    Click Element    //*[@id="modalMyProfile"]/div/div/div[3]/button[1]

create customer
    Click Element    id=dwhpMenuCustomerheaderList
    Wait Until Page Contains Element    //*[@id="sidebar-menu"]/div/ul/li[2]/ul/li/a/span
    Click Element    //*[@id="sidebar-menu"]/div/ul/li[2]/ul/li/a/span
    Wait Until Page Contains Element    //*[@id="customerDataTable_wrapper"]/div[1]/a[1]/span
    Click Element    //*[@id="customerDataTable_wrapper"]/div[1]/a[1]/span
    Clear Element Text    id=customerName
    Input Text    id=customerName    ${CUSTOMER_NAME}
    Clear Element Text    id=contactPerson
    Input Text    id=contactPerson    ${CUSTOMER_CONTACT}
    Clear Element Text    id=contactPhone
    Input Text    id=contactPhone    ${CUSTOMER_PHONE}
    Clear Element Text    id=contactAddress
    Input Text    id=contactAddress    ${CUSTOMER_ADDRESS}
    Clear Element Text    id=contactEmail
    Input Text    id=contactEmail    ${CUSTOMER_EMAIL}
    Clear Element Text    id=customerAdminUsername
    Input Text    id=customerAdminUsername    ${CUSTOMER_EMAIL}
    Clear Element Text    id=customerAdminPassword
    Input Text    id=customerAdminPassword    ${CUSTOMER_PASSWORD}
    Click Element    //*[@id="opencontroller1"]/span/i
    Click Element    id=chooseController
    Clear Element Text    id=customerAsnumber
    Input Text    id=customerAsnumber    65000
    Click Element    id=addCustomerBtn

assign devices to customer
    Wait Until Page Contains Element    id=dwhpMenuParternDevicesheaderList
    Click Element    id=dwhpMenuParternDevicesheaderList
    Wait Until Page Contains Element    id=hpMenupartnerUnassignedDevicesLabelsText
    Click Element    id=hpMenupartnerUnassignedDevicesLabelsText
    Wait Until Page Contains Element    xpath=//*[@id="partnerUnprovisionedTable_wrapper"]/div[1]/a[3]/span
    Click Element    //*[@id="partnerUnprovisionedTable_wrapper"]/div[1]/a[3]/span
    Wait Until Page Contains Element    id=customerAssignDeviceText
    Click Element    id=customerAssignDeviceText



deploy All sites
    [Arguments]  ${sitesdata}
    Click Element    id=dwhpMenuPartnerSitesheaderList
    Wait Until Page Contains Element    id=hpMenuSitesText
    Click Element    id=hpMenuSitesText
    Wait Until Page Contains    Map View
    FOR    ${sitedata}    IN    @{sitesdata}
        Wait Until Page Contains Element    //*[@id="siteDataTable_wrapper"]/div[1]/a[1]/span/i
        Click Element    //*[@id="siteDataTable_wrapper"]/div[1]/a[1]/span/i
        Clear Element Text    id=siteName
        Input Text    id=siteName    ${sitedata[0]}
        Clear Element Text    id=SiteAddr
        Input Text    id=SiteAddr    ${sitedata[1]}
        Wait Until Page Contains Element     //*[@id="getlocviewSite"]/ul/li[1]
        Wait Until Page Contains Element    //*[@id="getlocviewSite"]/ul/li[1]/a
        Click Element    //*[@id="getlocviewSite"]/ul/li[1]/a
        Wait Until Page Contains Element    //*[@id="addsite_modal"]/div/div/div[2]/div/button[2]
        Click Element    //*[@id="addsite_modal"]/div/div/div[2]/div/button[2]
        Select From List By Value    id=getLabelWan1    5
        Click Element    id=addSiteBtn
         
    END

deploy default hs overlay
    Click Element    id=dwhpMenuOverlaysheaderList
    Wait Until Page Contains Element    id=dwhpMenuOverlay
    Click Element    id=dwhpMenuOverlay
    Wait Until Page Contains Element    //*[@id="overlayDataTable_wrapper"]/div[1]/a[1]
    Click Element    //*[@id="overlayDataTable_wrapper"]/div[1]/a[1]
    Clear Element Text    id=overlayName
    Input Text    id=overlayName    Default_hs
    Click Element    id=topology1
    Click Element    id=WanLink
    #Select From List By Label    //*[@id="WanLink"]/span/span[1]/span/ul    internet
    Click Element    //*[@id="WanLink"]/span/span[1]/span/ul/li[1]
    Wait Until Page Contains    internet
    #Click Element    id=WanLink
    #Wait Until Page Contains    //*[@id="WanLink"]/span/span[1]/span/ul
    #Click Element    //*[@id="WanLink"]/span/span[1]/span/ul/li[2]
    Click Button    //*[@id="addOverlayBtn"]


deploy default mesh overlay1
    Click Element    id=dwhpMenuPartnerSitesheaderList
    Wait Until Page Contains Element    id=hpMenuSitesText
    Click Element    id=hpMenuSitesText
    Wait Until Page Contains Element    //*[@id="siteDataTable"]/tbody/tr[3]/td[8]/span/span
    FOR    ${numsite}    IN RANGE    1    4
        Click Element    //*[@id="siteDataTable"]/tbody/tr[${numsite}]/td[12]/div/a/i
        Wait Until Page Contains Element    //*[@id="siteDataTable"]/tbody/tr[${numsite}]/td[12]/div/div/a[2]
        Click Element    //*[@id="siteDataTable"]/tbody/tr[${numsite}]/td[12]/div/div/a[2]
        Wait Until Page Contains Element    //*[@id="addsite_modal"]/div/div/div[2]/div/button[3]
        Click Element    //*[@id="addsite_modal"]/div/div/div[2]/div/button[3]
        Click Element    id=check1
        Click Element    id=arrowViewleft
        IF    ${numsite} == 1
            Click Element    id=routeReflector
        END
        Click Element    id=addSiteBtn
        Wait Until Page Contains Element    //*[@id="siteDataTable"]/tbody/tr[3]/td[8]/span/span

    END


    ##################take screenshot part#######################

open monitoring
    Click Element    //*[@id="sidebar-menu"]/div/ul/li[11]
    Wait Until Page Contains    Traffic Visibility
    Wait Until Page Contains Element    //*[@id="sidebar-menu"]/div/ul/li[11]/ul/li[2]/a/span
    Click Element    //*[@id="sidebar-menu"]/div/ul/li[11]/ul/li[2]
    Wait Until Page Contains    Traffic Visibility

take basic screenshots
    Select From List By Value    id=tstatcustomerListId  1
    Click Element  id=apply_fltr
    Wait Until Page Contains Element    id=btn_aplication_volumeperoverlay
    Capture Element Screenshot  xpath=//*[@id="aplication_volumeperoverlay_g"]/div[1]/div  ../screenshots/Partner/partner_appvolumeperoverlay_screenshot.png
    Click Button  id=btn_domain_volumeperoverlay
    Capture Element Screenshot  //*[@id="domain_volumeperoverlay_g"]/div[1]  ../screenshots/Partner/partner_topprotocolsvolume_screenshot.png
    Click Button  id=btn_top_sites_ten
    Capture Element Screenshot  xpath=//*[@id="top_sites_ten_g"]/div[1]  ../screenshots/Partner/partner_topsite_screenshot.png
    Click Button  id=btn_talkers_volumeperoverlay
    Capture Element Screenshot  xpath=//*[@id="talkers_volumeperoverlay_g"]/div[1]  ../screenshots/Partner/partner_toplantakers_screenshot.png
    Click Button  id=btn_listeners_volumeperoverlay
    Capture Element Screenshot  xpath=//*[@id="listeners_volumeperoverlay_g"]/div[1]  ../screenshots/Partner/partner_toplanlisteners_screenshot.png
    Click Button  id=btn_bandwidth_overlay
    Capture Element Screenshot  xpath=//*[@id="bandwidth_overlay_g"]/div[1]  ../screenshots/Partner/partner_overlaybandwidthusage_screenshot.png
    Click Button  id=btn_wan_per_overlay_volume
    Capture Element Screenshot  xpath=//*[@id="wan_per_overlay_volume_g"]/div[1]  ../screenshots/Partner/partner_wanperoverlayvolume_screenshot.png

take all screenshots
    FOR    ${overlay}    IN    @{overlays}
        Select From List By Value    id=overlay_name  ${overlay}
        FOR    ${site}    IN    @{sites}
            Select From List By Value    siteslistgraph  ${site}
            Wait Until Page Contains Element    id=apply_fltr
            Click Element  id=apply_fltr
            Wait Until Page Contains Element    xpath=//*[@id="aplication_volumeperoverlay_g"]/div[1]/div
            Capture Element Screenshot  xpath=//*[@id="aplication_volumeperoverlay_g"]/div[1]/div  ../screenshots/Partner/${overlay}/${site}/partner_${overlay}_${site}_appvolumeperoverlay_screenshot.png
            Click Button  id=btn_domain_volumeperoverlay
            Capture Element Screenshot  //*[@id="domain_volumeperoverlay_g"]/div[1]  ../screenshots/Partner/${overlay}/${site}/partner_${overlay}_${site}_topprotocolsvolume_screenshot.png
            Click Button  id=btn_top_sites_ten
            Capture Element Screenshot  xpath=//*[@id="top_sites_ten_g"]/div[1]  ../screenshots/Partner/${overlay}/${site}/partner_${overlay}_${site}_topsite_screenshot.png
            Click Button  id=btn_talkers_volumeperoverlay
            Capture Element Screenshot  xpath=//*[@id="talkers_volumeperoverlay_g"]/div[1]  ../screenshots/Partner/${overlay}/${site}/partner_${overlay}_${site}_toplantakers_screenshot.png
            Click Button  id=btn_listeners_volumeperoverlay
            Capture Element Screenshot  xpath=//*[@id="listeners_volumeperoverlay_g"]/div[1]  ../screenshots/Partner/${overlay}/${site}/partner_${overlay}_${site}_toplanlisteners_screenshot.png
            Click Button  id=btn_bandwidth_overlay
            Capture Element Screenshot  xpath=//*[@id="bandwidth_overlay_g"]/div[1]  ../screenshots/Partner/${overlay}/${site}/partner_${overlay}_${site}_overlaybandwidthusage_screenshot.png
            Click Button  id=btn_wan_per_overlay_volume
            Capture Element Screenshot  xpath=//*[@id="wan_per_overlay_volume_g"]/div[1]  ../screenshots/Partner/${overlay}/${site}/partner_${overlay}_${site}_wanperoverlayvolume_screenshot.png
        END

    END

logout partner level
    Click Element    id=userName
    Click Link    xpath=/html/body/div[1]/div/div[2]/div/nav/ul[2]/li[1]/div/div[2]/a[2]
