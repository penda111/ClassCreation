*** Settings ***
Documentation     A test suite contating tests related to unsuccessful class creation
Suite Setup       Open Browser To Class Creation Page
Suite Teardown    Close Browser
Test Setup        Go To Class Creation Page
Test Template     Create Class With Missing Field(s) Should Fail
Resource          resource.robot

*** Variables ***
${Empty Select}    --Select--

*** Test Cases ***    TEACHER NAME       TITLE       DATE        MEDIUM             LEVEL
Missing Teacher Name
                      ${EMPTY}           ${TITLE}    ${DATE}     ${MEDIUM}          ${LEVEL}

Missing Title         ${TEACHER NAME}    ${EMPTY}    ${DATE}     ${MEDIUM}          ${LEVEL}

Missing Date          ${TEACHER NAME}    ${TITLE}    ${EMPTY}    ${MEDIUM}          ${LEVEL}

Missing Medium        ${TEACHER NAME}    ${TITLE}    ${DATE}     ${Empty Select}    ${LEVEL}

Missing Level         ${TEACHER NAME}    ${TITLE}    ${DATE}     ${MEDIUM}          ${Empty Select}

Missing All Fields    ${EMPTY}           ${EMPTY}    ${EMPTY}    ${Empty Select}    ${Empty Select}

*** Keywords ***
Create Class With Missing Field(s) Should Fail
    [Arguments]    ${teachername}    ${title}    ${date}    ${medium}    ${level}
    Input Teacher Name    ${teachername}
    Input Title    ${title}
    Input Date    ${date}
    Select Medium    ${medium}
    Select Level    ${level}
    Submit Class Info
    Class Creation Should Have Failed

Class Creation Should Have Failed
    Location Should Be    ${FAILED URL}
    Title Should be    Creation Failed Page
