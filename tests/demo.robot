*** Settings ***
Library    Browser

*** Test Cases ***
Verify Docker Container Environment
    New Browser    browser=chromium    headless=True
    New Page       about:blank
    Log            Docker funguje a Browser library léta!
    Close Browser