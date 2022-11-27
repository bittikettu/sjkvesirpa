*** Settings ***
Documentation       Enter water consumption to Kulutusweb

Library             RPA.Browser.Selenium

*** Variables ***
${URL}=     https://www.kulutus-web.com/seinajoki/vesi/suomi/
${kulutus}=    1075
${time} = 	${{ datetime.datetime.now().strftime("%d.%m.%Y") }}

*** Tasks ***
Open the intranet site and log in
    Log    ${time}    console=yes
    Open the intranet website
    Log in
    Wait Until Keyword Succeeds    20    1    Page Should Contain Element   menuItem2
    Open insert
    Wait Until Keyword Succeeds    20    1    Page Should Contain Element   f_pvm
    Insert date and other

*** Keywords ***
Open the intranet website
    Open Available Browser    ${URL}

Log in
    Input Text    kpiste    %{kulutuspiste}
    Input Text    mittarinro    %{mittarinumero}
    Submit Form

Open insert
    Click Element    menuItem2

Insert date and other
    Input Text     f_pvm  ${time}
    Input Text    f_vesi    ${kulutus}
    Input Text    phone    %{puhnro}
    Submit Form