*** Settings ***
Library          Browser
Variables        ../../config/env_loader.py
Test Teardown    Close Browser

*** Test Cases ***
Verify Loaded Page Title From Environment
    [Documentation]    Ověří, že se stránka z .env správně načte a má očekávaný titulek.
    [Tags]             positive    smoke
    
    New Browser        browser=chromium    headless=True
    New Page           ${BASE_URL}
    Get Title          ==    ${EXPECTED_TITLE}