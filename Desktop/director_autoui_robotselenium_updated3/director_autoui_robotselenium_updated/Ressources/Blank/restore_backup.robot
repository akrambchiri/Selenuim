*** Settings ***
Library  SSHLibrary
Resource  ../variables.robot
*** Keywords ***


blank devices
For-Loop-In-Range
     FOR    ${INDEX}    IN RANGE    1    8
        Log    ${INDEX}
        ${PORT_DEVICES} =  Set Variable  ${INDEX}22
        ${index}=  Open Connection   ${IP_SETUP}  port=${PORT_DEVICES}
        ${output}=	Login	admin	admin
        Should Contain	${output}	user
        Execute Command  copy /security/bsaStart.cfg /BSA/config/bsaStart.cfg
        Execute Command  restore factory-setting no-confirm
        Execute Command  reboot af 0

