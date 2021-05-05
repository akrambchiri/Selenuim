*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot
Resource  ../PO/SignIn.robot

*** Keywords ***

Test two login scenarios customers
    [Arguments]  ${Credentials}
    customer.Attempt Login  ${Credentials}

Attempt Login
    [Arguments]  ${Credentials}
    Wait Until Page Contains Element    ${SIGN_IN_EMAIL}
    SignIn.Enter Credentials  ${Credentials}
    ${pwd} =  Get Value    //*[@id="password"]
    SignIn.Click Submit
    IF    '${pwd}' == '${CUSTOMER_PASSWORD}'
         customer.change default password
    END

change default password
    Click Element  //*[@id="change_passwd_modal"]/div/div/div[2]/h5/a/b
    Wait Until Page Contains   Old Password
    Input Text  id=myPro_oldpasswd  ${CUSTOMER_PASSWORD}
    Clear Element Text  id=myPro_passwd
    Input Text  id=myPro_passwd  ${NEW_CUSTOMER_PASSWORD}
    Clear Element Text  id=myPro_confirmPasswd
    Input Text  id=myPro_confirmPasswd  ${NEW_CUSTOMER_PASSWORD}
    Click Element  //*[@id="modalMyProfile"]/div/div/div[3]/button[1]


charger la page web
    Go To  ${DIRECTOR_URL}
    Click Element  id=details-button
    Click Element  id=proceed-link
    Wait Until Page Contains   Login

login customer level
    Clear Element Text  name=uname
    Input Text  name=uname  ${CUSTOMER_LOGIN}
    Clear Element Text  name=passwd
    Input Text  name=passwd  ${NEW_CUSTOMER_PASSWORD}
    Click Element  xpath=//*[@id="login"]

##################take screenshot part#######################
open monitoring
    Click Element  id=dwhpMenuCustomerMonitoring
    Wait Until Page Contains  Traffic Visibility
    Click Element  id=dwCustomerNetflowStat
    Wait Until Page Contains  Traffic Visibility

take basic overlay screenshots
    Click Element  id=apply_fltr
    Wait Until Page Contains Element    id=btn_aplication_volumeperoverlay
    Capture Element Screenshot  xpath=//*[@id="aplication_volumeperoverlay_g"]/div[1]/div  ../screenshots/Customer/customer_appvolumeperoverlay_screenshot.png
    Click Button  id=btn_domain_volumeperoverlay
    Capture Element Screenshot  //*[@id="domain_volumeperoverlay_g"]/div[1]  ../screenshots/Customer/customer_topprotocolsvolume_screenshot.png
    Click Button  id=btn_top_sites_ten
    Capture Element Screenshot  xpath=//*[@id="top_sites_ten_g"]/div[1]  ../screenshots/Customer/customer_topsite_screenshot.png
    Click Button  id=btn_talkers_volumeperoverlay
    Capture Element Screenshot  xpath=//*[@id="talkers_volumeperoverlay_g"]/div[1]  ../screenshots/Customer/customer_toplantakers_screenshot.png
    Click Button  id=btn_listeners_volumeperoverlay
    Capture Element Screenshot  xpath=//*[@id="listeners_volumeperoverlay_g"]/div[1]  ../screenshots/Customer/customer_toplanlisteners_screenshot.png
    Click Button  id=btn_bandwidth_overlay
    Capture Element Screenshot  xpath=//*[@id="bandwidth_overlay_g"]/div[1]  ../screenshots/Customer/customer_overlaybandwidthusage_screenshot.png
    Click Button  id=btn_wan_per_overlay_volume
    Capture Element Screenshot  xpath=//*[@id="wan_per_overlay_volume_g"]/div[1]  ../screenshots/Customer/customer_wanperoverlayvolume_screenshot.png

take all overlay screenshots
    FOR    ${overlay}    IN    @{overlays}
        Select From List By Value    id=overlay_name  ${overlay}
        FOR    ${site}    IN    @{sites}
            Select From List By Value    siteslistgraph  ${site}
            Wait Until Page Contains Element    id=apply_fltr
            Click Element  id=apply_fltr
            Wait Until Page Contains Element    xpath=//*[@id="aplication_volumeperoverlay_g"]/div[1]/div
            Capture Element Screenshot  xpath=//*[@id="aplication_volumeperoverlay_g"]/div[1]/div  ../screenshots/Customer/Overlay/${overlay}/${site}/customer_${overlay}_${site}_appvolumeperoverlay_screenshot.png
            Click Button  id=btn_domain_volumeperoverlay
            Capture Element Screenshot  //*[@id="domain_volumeperoverlay_g"]/div[1]  ../screenshots/Customer/Overlay/${overlay}/${site}/customer_${overlay}_${site}_topprotocolsvolume_screenshot.png
            Click Button  id=btn_top_sites_ten
            Capture Element Screenshot  xpath=//*[@id="top_sites_ten_g"]/div[1]  ../screenshots/Customer/Overlay/${overlay}/${site}/customer_${overlay}_${site}_topsite_screenshot.png
            Click Button  id=btn_talkers_volumeperoverlay
            Capture Element Screenshot  xpath=//*[@id="talkers_volumeperoverlay_g"]/div[1]  ../screenshots/Customer/Overlay/${overlay}/${site}/customer_${overlay}_${site}_toplantakers_screenshot.png
            Click Button  id=btn_listeners_volumeperoverlay
            Capture Element Screenshot  xpath=//*[@id="listeners_volumeperoverlay_g"]/div[1]  ../screenshots/Customer/Overlay/${overlay}/${site}/customer_${overlay}_${site}_toplanlisteners_screenshot.png
            Click Button  id=btn_bandwidth_overlay
            Capture Element Screenshot  xpath=//*[@id="bandwidth_overlay_g"]/div[1]  ../screenshots/Customer/Overlay/${overlay}/${site}/customer_${overlay}_${site}_overlaybandwidthusage_screenshot.png
            Click Button  id=btn_wan_per_overlay_volume
            Capture Element Screenshot  xpath=//*[@id="wan_per_overlay_volume_g"]/div[1]  ../screenshots/Customer/Overlay/${overlay}/${site}/customer_${overlay}_${site}_wanperoverlayvolume_screenshot.png
        END

    END

move to site graph
    Click Link  xpath=//*[@id="tabContent1"]/div[2]/div[1]/nav/ul/li[2]/a

take basic sites screenshots
    Capture Element Screenshot    xpath=//*[@id="overlay_bwusage_g"]/div  ../screenshots/Customer/Overlay/customer_site_bandwidthusage_screenshot.png
    Click Button  id=btn_overlays_wanlinks
    Capture Element Screenshot    xpath=//*[@id="overlays_wanlinks_g"]  ../screenshots/Customer/Overlay/customer_site_wanlink_screenshot.png
    Click Button  id=btn_overlays_topapps
    Capture Element Screenshot    xpath=//*[@id="overlays_topapps_g"]  ../screenshots/Customer/Overlay/customer_site_topapplicationvolume_screenshot.png
    Click Button  id=btn_overlays_topdomain
    Capture Element Screenshot  xpath=//*[@id="overlays_topdomain_g"]  ../screenshots/Customer/Overlay/customer_site_topprotocolevolume_screenshot.png
    Click Button  id=btn_overlays_toptalkers
    Capture Element Screenshot  xpath=//*[@id="overlays_toptalkers_g"]  ../screenshots/Customer/Overlay/customer_site_toplantakers_screenshot.png
    Click Button  id=btn_overlays_toplisteners
    Capture Element Screenshot  xpath=//*[@id="overlays_toplisteners_g"]  ../screenshots/Customer/Overlay/customer_site_toplanlisteners_screenshot.png
    Click Button  id=btn_overlays_tcpthroput
    Capture Element Screenshot  xpath=//*[@id="overlays_tcpthroput_g"]  ../screenshots/Customer/Overlay/customer_site_tcpthroughput_screenshot.png


take all sites screenshots
    FOR    ${overlay}    IN    @{overlays}
        Select From List By Value    id=overlay_name  ${overlay}
        FOR    ${site}    IN    @{sites}
            Select From List By Value    siteslistgraph  ${site}
            Wait Until Page Contains Element    id=apply_fltr
            Click Element  id=apply_fltr
            Capture Element Screenshot    xpath=//*[@id="overlay_bwusage_g"]/div  ../screenshots/Customer/Overlay/customer_site_bandwidthusage_screenshot.png
            Click Button  id=btn_overlays_wanlinks
            Capture Element Screenshot    xpath=//*[@id="overlays_wanlinks_g"]  ../screenshots/Customer/Overlay/customer_site_wanlink_screenshot.png
            Click Button  id=btn_overlays_topapps
            Capture Element Screenshot    xpath=//*[@id="overlays_topapps_g"]  ../screenshots/Customer/Overlay/customer_site_topapplicationvolume_screenshot.png
            Click Button  id=btn_overlays_topdomain
            Capture Element Screenshot  xpath=//*[@id="overlays_topdomain_g"]  ../screenshots/Customer/Overlay/customer_site_topprotocolevolume_screenshot.png
            Click Button  id=btn_overlays_toptalkers
            Capture Element Screenshot  xpath=//*[@id="overlays_toptalkers_g"]  ../screenshots/Customer/Overlay/customer_site_toplantakers_screenshot.png
            Click Button  id=btn_overlays_toplisteners
            Capture Element Screenshot  xpath=//*[@id="overlays_toplisteners_g"]  ../screenshots/Customer/Overlay/customer_site_toplanlisteners_screenshot.png
            Click Button  id=btn_overlays_tcpthroput
            Capture Element Screenshot  xpath=//*[@id="overlays_tcpthroput_g"]  ../screenshots/Customer/Overlay/customer_site_tcpthroughput_screenshot.png

        END

    END


logout customer level
    Click Element  id=userName
    Click Link  xpath=/html/body/div[1]/div/div[2]/div/nav/ul/li[1]/div/div[2]/a[2]