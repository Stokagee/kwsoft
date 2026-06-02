*** Settings ***
Documentation    Tento test ověřuje, že Docker kontejner běží správně a Browser library funguje.

Resource    ../resources/common.resource

Test Teardown    Close Browser

*** Test Cases ***
Verify Docker Container Environment
    Initialize Browser Session    
    Log Action    Docker works, and the Browser library has been around for ages!