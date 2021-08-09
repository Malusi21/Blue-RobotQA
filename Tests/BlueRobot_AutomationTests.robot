*** Settings ***

Resource    _include.robot

*** Test Cases ***
Get User Address
    [Documentation]
    [Tags]    api
    ${auth}=    Create List  ${Blue-robot_username}  ${Blue-robot_password}
    ${Headers}=    Create Directory    Content-Type=application/json Accept=application/json
    ${Session}=    Create Session    ${Blue-robot}    ${Blue-robot_url}    auth=${auth}    disable_warnings=1
    ${Get_Response}=	GET On Session    ${Blue-robot}    /address    headers=${Headers}    expected_status=Anything
    Should Be Equal As Integers    200    ${Get_Response.status_code}
    Log    ${Get_Response.json()}
    ${ResponseJson}=    Set Test Variable    ${Get_Response.json()}

Browser Student Registration
    [Documentation]
    Open Browser and Validate Landing page
