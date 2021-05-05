*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource  ../variables.robot
Resource  ../common.robot
Resource  ../PO/SignIn.robot


*** Keywords ***
Test two login scenarios
    [Arguments]  ${Credentials}
    sp.Attempt Login  ${Credentials}

charger la page web
    Go To  ${DIRECTOR_URL}
    Click Element  id=details-button
    Click Element  id=proceed-link
    Wait Until Page Contains   Login

Attempt Login
    [Arguments]  ${Credentials}
    SignIn.Enter Credentials  ${Credentials}
    ${pwd} =  Get Value    //*[@id="password"]
    SignIn.Click Submit
    IF    '${pwd}' == 'admin'
         sp.change default password
    END



login service provider level
    Clear Element Text  name=uname
    Input Text  name=uname  ${SP_LOGIN}
    Clear Element Text  name=passwd
    Input Text  name=passwd  ${NEW_SP_PASSWORD}
    Click Button  xpath=//*[@id="login"]

change default password
    Click Element  //*[@id="change_passwd_modal"]/div/div/div[2]/h5/a/b
    Wait Until Page Contains   My Profile
    Set Selenium Speed    1s
    Input Text  id=myPro_oldpasswd  ${SP_PASSWORD}
    Clear Element Text  id=myPro_passwd
    Input Text  id=myPro_passwd  ${NEW_SP_PASSWORD}
    Clear Element Text  id=myPro_confirmPasswd
    Input Text  id=myPro_confirmPasswd  ${NEW_SP_PASSWORD}
    Click Element  //*[@id="modalMyProfile"]/div/div/div[3]/button[1]
    

    

create a pop
    Click Element  id=dwhpMenuPopListHeader
    Wait Until Page Contains Element    id=dwhpMenuPopList
    Click Element   id=dwhpMenuPopList
    Wait Until Page Contains    PoP List
    Click Element  //*[@id="popListTable_wrapper"]/div[1]/a[1]/span
    Wait Until Page Contains    PoP Parameters
    Clear Element Text  id=popName
    Input Text  xpath=//*[@id="popName"]  ${POP_NAME}
    Clear Element Text  id=pop_Address
    Input Text  id=pop_Address  ${POP_ADD}
    Wait Until Page Contains Element    //*[@id="getlocview"]/ul/li[1]
    Wait Until Page Contains Element    css=#getlocview > ul > li:nth-child(1) > a
    Click Element  css=#getlocview > ul > li:nth-child(1) > a
    Wait Until Page Contains Element    //*[@id="addPopBtn"]
    Click Element  //*[@id="addPopBtn"]

create a partner
    Click Element  id=dwhpMenuPartnerheaderList
    Wait Until Page Contains Element    id=dwhpMenuPartnerListlabel
    Click Element  id=dwhpMenuPartnerListlabel
    Wait Until Page Contains Element    //*[@id="partnerDataTable_wrapper"]/div[1]/a[1]
    Click Element  //*[@id="partnerDataTable_wrapper"]/div[1]/a[1]
    Clear Element Text  id=partnerName
    Input Text  id=partnerName  ${PARTNER_NAME}
    Clear Element Text  id=pcontactPerson
    Input Text  id=pcontactPerson  admin
    Clear Element Text  id=pcontactPhone
    Input Text  id=pcontactPhone  0101010101
    Clear Element Text  id=pcontactAddress
    Input Text  id=pcontactAddress  ${PARTNER_ADDRESS}
    Clear Element Text  id=pcontactEmail
    Input Text  id=pcontactEmail  ${PARTNER_EMAIL}
    Clear Element Text  id=adminUsername
    Input Text  id=adminUsername  ${PARTNER_EMAIL}
    Clear Element Text  id=adminPassword
    Input Text  id=adminPassword  ${PARTNER_PASSWORD}
    Click Element  id=addPartnerBtn

create controller
    Wait Until Page Contains Element    //*[@id="sidebar-menu"]/div/ul/li[6]/a
    Click Element  //*[@id="sidebar-menu"]/div/ul/li[6]/a
    Wait Until Page Contains Element    //*[@id="sidebar-menu"]/div/ul/li[6]/ul/li/a
    Click Element  //*[@id="sidebar-menu"]/div/ul/li[6]/ul/li/a
    Wait Until Page Contains Element    //*[@id="controllerTable_wrapper"]/div[1]/a[1]
    Click Element  //*[@id="controllerTable_wrapper"]/div[1]/a[1]
    Clear Element Text  id=controllerName
    Input Text  id=controllerName  ${CTRL_NAME}
    Clear Element Text  id=manageIpAddress
    Input Text  id=manageIpAddress  ${CTRL_FQDN_IP1}
    Clear Element Text  id=controlIpAddress
    Input Text  id=controlIpAddress  ${CTRL_FQDN_IP2}
    Select From List By Value  id=controllerPOPSelect  ${POP_NAME}
    Select From List By Value  controllerpartnerSelect  ${PARTNER_NAME}
    Click Element  id=addcontrollerbtn

assign sites to partner
    Click Element  id=dwhpMenuDevicesheaderlabel
    Click Element  //*[@id="sidebar-menu"]/div/ul/li[4]/ul/li[2]
    Click Element  //*[@id="spDeviceTable_wrapper"]/div[1]/a[4]
    Select from list by label   id="assignPartnerid"   ${PARTNER_NAME}
    Click Element  id=AssignDeviceText


##################take screenshot part#######################
open monitoring
    Wait Until Page Contains Element    xpath=//*[@id="sidebar-menu"]/div/ul/li[10]/a/i
    Click Element  id=dwhpMenuMonitoring
    Wait Until Page Contains  Traffic Visibility
    Wait Until Page Contains Element    xpath=//*[@id="NetflowStatDwText"]
    Click Element  //*[@id="sidebar-menu"]/div/ul/li[9]/ul/li[3]
    Wait Until Page Contains  Traffic Visibility

take basic screenshots
    Select From List By Value    id=tstatpartnerListId  1
    Select From List By Value    id=tstatcustomerListId  1
    Click Element  id=apply_fltr
    Wait Until Page Contains Element    id=btn_aplication_volumeperoverlay
    Capture Element Screenshot  xpath=//*[@id="aplication_volumeperoverlay_g"]/div[1]/div  ../screenshots/SP/sp_appvolumeperoverlay_screenshot.png
    Click Button  id=btn_domain_volumeperoverlay
    Capture Element Screenshot  //*[@id="domain_volumeperoverlay_g"]/div[1]  ../screenshots/SP/sp_topprotocolsvolume_screenshot.png
    Click Button  id=btn_top_sites_ten
    Capture Element Screenshot  xpath=//*[@id="top_sites_ten_g"]/div[1]  ../screenshots/SP/sp_topsite_screenshot.png
    Click Button  id=btn_talkers_volumeperoverlay
    Capture Element Screenshot  xpath=//*[@id="talkers_volumeperoverlay_g"]/div[1]  ../screenshots/SP/sp_toplantakers_screenshot.png
    Click Button  id=btn_listeners_volumeperoverlay
    Capture Element Screenshot  xpath=//*[@id="listeners_volumeperoverlay_g"]/div[1]  ../screenshots/SP/sp_toplanlisteners_screenshot.png
    Click Button  id=btn_bandwidth_overlay
    Capture Element Screenshot  xpath=//*[@id="bandwidth_overlay_g"]/div[1]  ../screenshots/SP/sp_overlaybandwidthusage_screenshot.png
    Click Button  id=btn_wan_per_overlay_volume
    Capture Element Screenshot  xpath=//*[@id="wan_per_overlay_volume_g"]/div[1]  ../screenshots/SP/sp_wanperoverlayvolume_screenshot.png
        
take all screenshots
    FOR    ${overlay}    IN    @{overlays}
        Select From List By Value    id=overlay_name  ${overlay}
        FOR    ${site}    IN    @{sites}
            Select From List By Value    siteslistgraph  ${site}
            Wait Until Page Contains Element    id=apply_fltr          
            Click Element  id=apply_fltr
            Wait Until Page Contains Element    xpath=//*[@id="aplication_volumeperoverlay_g"]/div[1]/div
            Capture Element Screenshot  xpath=//*[@id="aplication_volumeperoverlay_g"]/div[1]/div  ../screenshots/SP/${overlay}/${site}/sp_${overlay}_${site}_appvolumeperoverlay_screenshot.png
            Click Button  id=btn_domain_volumeperoverlay
            Capture Element Screenshot  //*[@id="domain_volumeperoverlay_g"]/div[1]  ../screenshots/SP/${overlay}/${site}/sp_${overlay}_${site}_topprotocolsvolume_screenshot.png
            Click Button  id=btn_top_sites_ten
            Capture Element Screenshot  xpath=//*[@id="top_sites_ten_g"]/div[1]  ../screenshots/SP/${overlay}/${site}/sp_${overlay}_${site}_topsite_screenshot.png
            Click Button  id=btn_talkers_volumeperoverlay
            Capture Element Screenshot  xpath=//*[@id="talkers_volumeperoverlay_g"]/div[1]  ../screenshots/SP/${overlay}/${site}/sp_${overlay}_${site}_toplantakers_screenshot.png
            Click Button  id=btn_listeners_volumeperoverlay
            Capture Element Screenshot  xpath=//*[@id="listeners_volumeperoverlay_g"]/div[1]  ../screenshots/SP/${overlay}/${site}/sp_${overlay}_${site}_toplanlisteners_screenshot.png
            Click Button  id=btn_bandwidth_overlay
            Capture Element Screenshot  xpath=//*[@id="bandwidth_overlay_g"]/div[1]  ../screenshots/SP/${overlay}/${site}/sp_${overlay}_${site}_overlaybandwidthusage_screenshot.png
            Click Button  id=btn_wan_per_overlay_volume
            Capture Element Screenshot  xpath=//*[@id="wan_per_overlay_volume_g"]/div[1]  ../screenshots/SP/${overlay}/${site}/sp_${overlay}_${site}_wanperoverlayvolume_screenshot.png
        END

    END

Logout service provider level
    Click Element  id=userName
    Wait Until Page Contains Element    xpath=/html/body/div[1]/div/div[2]/div/nav/ul/li[1]/div/div[2]/a[2]
    Click Link  xpath=/html/body/div[1]/div/div[2]/div/nav/ul/li[1]/div/div[2]/a[2]