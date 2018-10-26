*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    %{BROWSER}
${REMOTE_SELENIUM_SERVER}    %{REMOTE_SELENIUM_SERVER}

*** Test Cases ***
Visit Robot Framework
    Open Browser    http://robotframework.org/    ${BROWSER}
    ...    remote_url=http://${REMOTE_SELENIUM_SERVER}:4444/wd/hub
    Capture Page Screenshot

Visit Bing
    Open Browser    https://www.bing.com    ${BROWSER}
    ...    remote_url=http://${REMOTE_SELENIUM_SERVER}:4444/wd/hub
    Capture Page Screenshot

Visit Google
    Open Browser    https://www.google.com    ${BROWSER}
    ...    remote_url=http://${REMOTE_SELENIUM_SERVER}:4444/wd/hub
    Capture Page Screenshot

Visit Yahoo
    Open Browser    https://search.yahoo.com    ${BROWSER}
    ...    remote_url=http://${REMOTE_SELENIUM_SERVER}:4444/wd/hub
    Capture Page Screenshot

