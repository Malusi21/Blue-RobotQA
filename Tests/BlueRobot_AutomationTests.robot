*** Settings ***
Resource    _include.robot
Force Tags    bluerobot

#robot -d Results -v BROWSER:chrome -v GENDER:Male -v HOBBY:Sports -v CITY:Karnal -v STATE:Haryana -v SUBJECTS: -i bluerobot Tests/BlueRobot_AutomationTests.robot

*** Test Cases ***
Get User Address
    [Documentation]    API test that does a get and stores the student address retreived from the get call
    [Tags]    api
    ${auth}=    Create List  ${Blue-robot_username}  ${Blue-robot_password}
    ${Headers}=    Create Directory    Content-Type=application/json Accept=application/json
    ${Session}=    Create Session    ${Blue-robot}    ${Blue-robot_url}    auth=${auth}    disable_warnings=1
    ${Get_Response}=	GET On Session    ${Blue-robot}    /address    headers=${Headers}    expected_status=Anything
    Should Be Equal As Integers    200    ${Get_Response.status_code}
    Log    ${Get_Response.json()}
    Set Test Variable    ${ResponseJson}    ${Get_Response.json()}
    Get User Address from Json    ${ResponseJson}

Browser Student Registration
    [Documentation]    UI Browser test that Enters and previews student details on the practice registration form
    [Tags]    ui
    Open Browser and Validate Landing page    ${Auto-Practice_url}
    Enter Student Registration details
    Confirm and Submit Form
    Validate Student Details Entered In Practice Form
    [Teardown]    Close Browser
