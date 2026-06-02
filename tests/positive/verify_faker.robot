*** Settings ***
Documentation    Tento test ověřuje, že faker library funguje správně a generuje data.

Resource    ../../resources/common.resource

*** Test Cases ***
Verify Faker Library
    [Documentation]    Ověřuje, že faker library generuje data správně.
    ${name}=    First Name
    ${email}=   Email
    ${address}=    Address

    Log Action    Generated Name: ${name}
    Log Action    Generated Email: ${email}
    Log Action    Generated Address: ${address}

    Should Not Be Empty    ${name}
    Should Not Be Empty    ${email}
    Should Not Be Empty    ${address}