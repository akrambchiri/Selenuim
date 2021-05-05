*** Settings ***
Library  DateTime

*** Variables ***

&{first_login}  Email=${SP_LOGIN}  Password=admin
&{another_login}  Email=${SP_LOGIN}  Password=Adminsp01!

&{first_login_partner}  Email=${PARTNER_LOGIN}  Password=${PARTNER_PASSWORD}
&{another_login_partner}  Email=${PARTNER_LOGIN}  Password=${NEW_PARTNER_PASSWORD}

&{first_login_customer}  Email=${CUSTOMER_LOGIN}  Password=${CUSTOMER_PASSWORD}
&{another_login_customer}  Email=${CUSTOMER_LOGIN}  Password=${NEW_CUSTOMER_PASSWORD}



${BROWSER} =  chrome
${IP_SETUP} =  10.1.20.4
## director ovp_tb-1
${DIRECTOR_URL} =  https://10.1.20.4:4443/titan-ui/login.php
## director ovp scala
#${DIRECTOR_URL} =  https://10.1.20.146:4443/titan-ui/login.php
## director ovp test-bed6
#${DIRECTOR_URL} =  https://10.1.20.41:4443/titan-ui/login.php
# director ovp test-bed9
#${DIRECTOR_URL} =  https://10.1.20.30:4443/titan-ui/login.php
${SP_LOGIN} =  admin
${SP_PASSWORD} =  admin
#${SP_PASSWORD} =  Adminsp01!
${NEW_SP_PASSWORD} =  Adminsp01!


#${PARTNER_LOGIN} =  admin@act.com
#${PARTNER_PASSWORD} =  admin123B
${PARTNER_LOGIN} =  admin@pap01.com
${PARTNER_PASSWORD} =  Adminpap01!
${NEW_PARTNER_PASSWORD} =  Adminpap02!
${PARTNER_NAME} =  pap01
${PARTNER_ADDRESS} =  Velizy 78
${PARTNER_EMAIL} =  admin@pap01.com


#${CUSTOMER_LOGIN} =  admin@ekinops.com
#${CUSTOMER_PASSWORD} =  admin123B
${CUSTOMER_LOGIN} =  admin@cust01.com
${CUSTOMER_PASSWORD} =  Admincust01!
${NEW_CUSTOMER_PASSWORD} =  Admincust02!
${CUSTOMER_NAME} =  Cust01
${CUSTOMER_CONTACT} =  admin
${CUSTOMER_PHONE} =  020202020202
${CUSTOMER_ADDRESS} =  Velizy 78
${CUSTOMER_EMAIL} =  admin@cust01.com

${CTRL_NAME} =  Ctrl1

${CTRL_FQDN_IP1} =  12.1.1.22
${CTRL_FQDN_IP2} =  12.1.1.22

${PATH_TO_DIRECTORY} =  C:\Users\biak\Desktop\director_autoui_robotselenium
${POP_NAME} =  pop
${POP_ADD} =  Velizy 78
${FIRST_SITE_NAME} =  Site1
${FIRST_SITE_ADDRESS} =  Brest 29
${SECOND_SITE_NAME} =  Site2
${SECOND_SITE_ADDRESS} =  Lille 59
${THIRD_SITE_NAME} =  Site3
${THIRD_SITE_ADDRESS} =  Lyon 69
${FOURTH_SITE_NAME} =  Site4
${FOURTH_SITE_ADDRESS} =  Chartres 28
${GW_SITE_NAME} =  Gateway1
${GW_SITE_ADDRESS} =  Paris 75

@{sites} =  Site1  Site2  Site3
@{overlays} =  Default  Default-Breakout