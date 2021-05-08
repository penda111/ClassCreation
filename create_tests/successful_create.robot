*** Settings ***
Documentation     A test suite with a single test for successful class creation
Resource          resource.robot

*** Test Cases ***
Sucessful Class Creation
    Open Browser To Class Creation Page
    Input Teacher Name    David
    Input Title    Yoga Class for Novice
    Input Date    02-05-2021
    Select Medium    Cantonese
    Select Level    Beginner
    Submit Class Info
    Class Creation Successful Page Should Be Open
    [Teardown]    Close Browser
