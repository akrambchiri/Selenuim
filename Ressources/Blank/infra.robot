*** Settings ***
Resource  ../variables.robot
Library           SSHLibrary
Library           String

*** Keywords ***
blank director
    ${index}=    Open Connection    10.1.20.30    port=2022
    ${output}=    Login    user    adminadmin
    Should Contain    ${output}    user
    Execute Command    cd /usr/local/sdwandirector/deploy/ ;docker-compose down
    #Sleep    20s
    Execute Command    cd /usr/local/sdwandirector/deploy/ ;docker volume prune -f
    #Sleep    20s
    Execute Command    cd /usr/local/sdwandirector/deploy/ ;docker-compose up -d
    #Sleep    20s

blank controller
    ${index}=    Open Connection    10.1.20.30    port=2122
    ${output}=    Login    user    adminadmin
    Should Contain    ${output}    user
    Execute Command    cd /usr/local/sdwanctrl/deploy/ ;docker-compose down
    #Sleep    20s
    Execute Command    cd /usr/local/sdwanctrl/deploy/ ;docker volume prune -f
    #Sleep    20s
    Execute Command    cd /usr/local/sdwanctrl/deploy/ ; sudo sed -i -e "s/CLEANUP_SSH=0/CLEANUP_SSH=1/g" docker-compose.yml
    #Sleep    20s
    Execute Command    cd /usr/local/sdwanctrl/deploy/ ;docker-compose up -d
    #Sleep    20s
    Execute Command    cd /usr/local/sdwanctrl/deploy/ ; sudo sed -i -e "s/CLEANUP_SSH=1/CLEANUP_SSH=0/g" docker-compose.yml
    #Sleep    20s

blank devices
     FOR    ${INDEX}    IN RANGE    1    6
       Log    ${INDEX}
       ${b}=  Set Variable   22
       ${PORT}=    Set Variable   ${INDEX}${b}
       Log  ${PORT}
       ${index}=  Open Connection   10.1.20.4  port=${PORT}
       ${output}=	Login	admin	admin
       Should Contain    ${output}    admin
       Execute Command    copy /security/bsaStart.cfg /BSA/config/bsaStart.cfg
       Execute Command    restore factory-setting no-confirm
       Close Connection
     END