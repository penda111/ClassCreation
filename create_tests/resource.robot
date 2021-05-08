*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          0
${TEACHER NAME}    David
${DATE}           02-05-2021
${TITLE}          Yoga Class for Novice
${MEDIUM}         Cantonese
${LEVEL}          Beginner
${CLASS CREATE URL}    http://${SERVER}/
${SUCCESSFUL URL}    http://${SERVER}/createsuccessful.html
${FAILED URL}     http://${SERVER}/createfailed.html

*** Keywords ***
Open Browser To Class Creation Page
    Open Browser    ${CLASS CREATE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Class Creation Page Should Be Open

Class Creation Page Should Be Open
    Title Should Be    Class Creation Page

Go To Class Creation Page
    Go To    ${CLASS CREATE URL}
    Class Creation Page Should Be Open

Input Teacher Name
    [Arguments]    ${teachername}
    Input Text    Teachername_field    ${teachername}

Input Title
    [Arguments]    ${title}
    Input Text    Title_field    ${title}

Input Date
    [Arguments]    ${date}
    Input Text    Date_field    ${date}

Select Medium
    [Arguments]    ${medium}
    click element    xpath=//select[@id="Medium_field"]
    click element    xpath=//option[text()='${medium}']

Select Level
    [Arguments]    ${level}
    click element    xpath=//select[@id="Level_field"]
    click element    xpath=//option[text()='${level}']

Submit Class Info
    Click Button    create_button

Class Creation Successful Page Should Be Open
    Location Should Be    ${SUCCESSFUL URL}
    Title Should Be    Class Creation Successful Page
