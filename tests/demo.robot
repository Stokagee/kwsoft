*** Settings ***
Documentation    Tento test ověřuje, že Docker kontejner běží správně a Browser library funguje.

Resource    ../resources/common.resource


*** Test Cases ***
Verify Docker Container Environment
    [Setup]    Initialize Browser Session    
    Log Action    Docker works, and the Browser library has been around for ages!
    [Teardown]    Close Browser Session