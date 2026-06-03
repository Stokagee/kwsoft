*** Settings ***
Documentation    Tento test ověřuje, že se stránka z .env správně načte a má očekávaný titulek.

Resource    ../../resources/common.resource

*** Test Cases ***
Verify Loaded Page Title From Environment
    [Documentation]    Ověří, že se stránka z .env správně načte a má očekávaný titulek.
    [Tags]             positive    smoke
    [Setup]    Initialize Browser Session
    Get Title          ==    ${EXPECTED_TITLE}
    [Teardown]    Close Browser Session