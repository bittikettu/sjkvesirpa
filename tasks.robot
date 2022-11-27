*** Settings ***
Documentation       Enter water consumption to Kulutusweb

Library             RPA.Browser.Selenium
Library             DateTime

*** Variables ***
${URL}=     https://www.kulutus-web.com/seinajoki/vesi/suomi/
${kulutuspiste}=  1234567
${mittarinumero}=   124567
${puhnro}=    04012354566
${kulutus}=   100
#${date} = 	Get Current Date 	date_format=%d.%m.%Y
${time} = 	${{ datetime.datetime.now().strftime("%d.%m.%Y") }}

*** Tasks ***
Open the intranet site and log in
    Log    ${time}    console=yes
    Open the intranet website
    Log in
    #Wait For Condition	return document.readyState == "complete"
    Wait Until Keyword Succeeds    20    1    Page Should Contain Element   menuItem2
    Openopen
    Wait Until Keyword Succeeds    20    1    Page Should Contain Element   f_pvm
    Insert date and other


    

*** Keywords ***
Open the intranet website
    Open Available Browser    ${URL}

Log in
    Input Text    kpiste    ${kulutuspiste}
    Input Text    mittarinro    ${mittarinumero}
    Submit Form

Openopen
    Click Element    menuItem2

Insert date and other
    #Click Element    f_pvm
    Input Text     f_pvm  ${time}
    Input Text    f_vesi    ${kulutus}
    Input Text    phone    ${puhnro}
    Submit Form