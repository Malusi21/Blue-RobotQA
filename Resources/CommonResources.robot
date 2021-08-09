*** Settings ***
Resource    ../Tests/_include.robot

*** Variables ***
${Blue-robot}    bluerobot
${Blue-robot_url}    https://blue-robot.mocklab.io
${Auto-Practice_url}    https://demoqa.com/automation-practice-form
${Blue-robot_username}    test1
${Blue-robot_password}    test1
${BrowserWait}    30
${BrowserWait_retry}    5


*** Keywords ***
Open Browser and Validate Landing page
    [Documentation]    Helper keyword to open the browser and Validate the landing page that the user is redirected to
    Open Browser    ${Auto-Practice_url}    ${BROWSER}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Location Should Be    ${Auto-Practice_url}