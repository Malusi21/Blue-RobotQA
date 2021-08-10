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
${Form_header}    //*[@id="app"]/div/div/div[1]/div[contains(.,"Practice Form")]
${FirstName_field}    //*[@id="firstName"]
${LastName_field}    //*[@id="lastName"]
${Email_field}    //*[@id="userEmail"]
${MobileNumber_field}    //*[@id="userNumber"]
${DateOfBirth_field}    //*[@id="dateOfBirthInput"]
${Subjects_field}    //*[@id="subjectsInput"]
${UploadField}    //*[@id="uploadPicture"]
${GenderTitle}    //*[@id="genterWrapper"]/div[contains(.,"Gender")]
${HobbyTitle}    //*[@id="subjects-label"][contains(.,"Hobbies")]
${CurrentAddress_field}    //*[@id="currentAddress"]
${StateDropdown}    //*[@id="stateCity-wrapper"]/div[2]
${CityDropdown}    //*[@id="stateCity-wrapper"]/div[3]
${SubmitButton}    //*[@id="submit"]
${Close_preview_button}    //*[@id="closeLargeModal"]
${Male-RadioButton}    //*[@id="genterWrapper"]//label[contains(.,"Male")]
${Female-RadioButton}    //*[@id="genterWrapper"]//label[contains(.,"Female")]
${Other-RadioButton}    //*[@id="genterWrapper"]//label[contains(.,"Other")]
${Hobby-Sport}    //*[@id="hobbiesWrapper"]/div[2]/div[1]/label[contains(.,"Sports")]
${Hobby-Reading}    //*[@id="hobbiesWrapper"]/div[2]/div[2]/label[contains(.,"Reading")]
${Hobby-Music}    //*[@id="hobbiesWrapper"]/div[2]/div[3]/label[contains(.,"Music")]
${State_Uttar Pradesh}    //*[@id="state"]//font/font[contains(.,"Uttar Pradesh")]
${State_Uttar Pradesh_dropdownItem}    //*[@id="react-select-3-option-1"][contains(.,"Uttar Pradesh")]
${State_Rajasthan}    //*[@id="state"]//font/font[contains(.,"Rajasthan")]
${State_Rajasthan_dropdownItem}    //*[@id="react-select-3-option-3"][contains(.,"Uttar Pradesh")]
${State_Haryana}    //*[@id="state"]//font/font[contains(.,"Haryana")]
${State_Haryana_dropdownItem}    //*[@id="react-select-3-option-2"][contains(.,"Haryana")]
${City_Haryana_Karnal_dropdownItem}    //*[@id="react-select-4-option-0"][contains(.,"Karnal")]
${State_NCR}    //*[@id="state"]//font/font[contains(.,"NCR")]
${State_NCR_dropdownItem}    //*[@id="react-select-3-option-0"][contains(.,"Haryana")]
${DetaislPrview_close}    //*[@id="closeLargeModal"]
${GenderNotFound_message}    The Gender passed in for the Student detail is incorrect - ${GENDER}
${HobbiesNotFound_message}    The Hobby passed in for the Student detail is incorrect - ${HOBBY}
#User Details
${Firstname}    Blue-Auto
${Lastname}    Robot-Mation
${Mobile}    0254658745
${Email}    malusi@gmail.com
${DOB}    03
${New_DOB}    10 August,2003       #This is due to the issue with trying to clear the Date field correctly
${File_Name}    Profile.jpg
${google_advert}    //*[@id="close-fixedban"]/img     #Google Advert blocking Close button on preview modal


*** Keywords ***
Get User Address from Json
    [Documentation]    Helper keyword thatthat helps get and set the user address returned
    [Arguments]    ${RecievedJson}
    ${ID_value}=    Get Value From Json    ${RecievedJson}    $..id
    ${Address_value}=    Get Value From Json    ${RecievedJson}    $..address
    ${ID_value}=    Convert JSON To String    ${ID_value[0]}
    ${Address_value}=    Convert JSON To String    ${Address_value[0]}
    Log    ${ID_value}
    Log    ${Address_value}
    Set Suite Variable    ${id}    ${ID_value}
    Set Suite Variable    ${address}    ${Address_value}

Open Browser and Validate Landing page
    [Documentation]    Helper keyword to open the browser and Validate the landing page that the user is redirected to by taking in the url and capturing a screenshot
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Location Should Be    ${url}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Maximize Browser Window
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Capture Page Screenshot
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Page Should Contain Element    ${Form_header}

Enter Student Registration details
    [Documentation]    Keyword that populates the Practice form with the Student details
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Input Text    ${FirstName_field}    ${Firstname}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Input Text    ${LastName_field}    ${Lastname}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Input Text    ${Email_field}    ${Email}
    Select Gender option
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Input Text    ${MobileNumber_field}    ${Mobile}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${DateOfBirth_field}
    Update Date Field
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Input Text    ${DateOfBirth_field}    ${DOB}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Capture Page Screenshot
    Execute JavaScript    window.scrollTo(0, 200)
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Set Focus To Element    ${Subjects_field}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Input Text    ${Subjects_field}    ${SUBJECTS}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Press Keys    ${Subjects_field}    ENTER
    Execute JavaScript    window.scrollTo(0, 600)
    Select Hobby Option
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Choose File    ${UploadField}    ${EXECDIR}${/}Resources/${File_Name}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Input Text    ${CurrentAddress_field}    ${address}
    Execute JavaScript    window.scrollTo(0, 400)
    Select City and State Option

Validate Student Details Entered In Practice Form
    [Documentation]    Keyword validates the detals entered by the student
    Execute JavaScript    window.scrollTo(0, 900)
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Page Should Contain    ${Firstname}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Page Should Contain    ${Lastname}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Page Should Contain    ${Email}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Page Should Contain    ${GENDER}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Page Should Contain    ${Mobile}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Page Should Contain    ${HOBBY}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Page Should Contain    ${New_DOB}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Page Should Contain    ${SUBJECTS}
    Execute JavaScript    window.scrollTo(0, 900)
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Page Should Contain    ${File_Name}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Page Should Contain    ${address}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Page Should Contain    ${STATE}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Page Should Contain    ${CITY}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${google_advert}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${Close_preview_button}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Capture Page Screenshot

Select Gender Option
    [Documentation]    Helper keyword to select an option from the available Genders on the form, using the gender passed in the test
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${GenderTitle}
    Run Keyword If    '${GENDER}' == 'Male'    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${Male-RadioButton}
    ...    ELSE IF    '${GENDER}' == 'Female'    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${Female-RadioButton}
    ...    ELSE IF    '${GENDER}' == 'Other'    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${Other-RadioButton}
    ...    ELSE    Log    ${GenderNotFound_message}

Select Hobby Option
    [Documentation]    Helper keyword to select an option from the available Hobbies on the form, using the Hobby passed in the test
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${HobbyTitle}
    Run Keyword If    '${HOBBY}' == 'Sports'    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${Hobby-Sport}
    ...    ELSE IF    '${HOBBY}' == 'Reading'    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${Hobby-Reading}
    ...    ELSE IF    '${HOBBY}' == 'Music'    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${Hobby-Music}
    ...    ELSE    Log    ${HobbiesNotFound_message}

Select City and State Option
    [Documentation]    Helper keyword to select the city and state values, state values used are default values
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${StateDropdown}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${State_Haryana_dropdownItem}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${CityDropdown}
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${City_Haryana_Karnal_dropdownItem}

Confirm and Submit Form
    [Documentation]    Helper keyword to Confirm and Submit form
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Capture Page Screenshot
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    Click Element    ${SubmitButton}

Update Date Field
    [Documentation]    Helper keyword to update the year value on the Date field
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    press keys    ${DateOfBirth_field}    BACKSPACE
    Wait Until Keyword Succeeds    ${BrowserWait}    ${BrowserWait_retry}    press keys    ${DateOfBirth_field}    BACKSPACE