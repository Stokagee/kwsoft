*** Settings ***
Documentation     Login page resource file

Resource    ../common.resource
Resource    ../locators/login_locators.resource

*** Keywords ***


Vyplnit Prihlasovaci Jmeno
    [Documentation]    Vyplni pole pro prihlasovaci jmeno
    [Arguments]    ${username}
    Fill Field    ${LOGIN_PAGE_USERNAME_INPUT}    ${username}    context_name=Vyplnit Prihlasovaci Jmeno

Vyplnit Heslo
    [Documentation]    Vyplni pole pro heslo
    [Arguments]    ${password}
    Fill Field    ${LOGIN_PAGE_PASSWORD_INPUT}    ${password}    context_name=Vyplnit Heslo

Odeslat Prihlaseni
    [Documentation]    Klikne na tlacitko pro odeslani prihlaseni
    Click Element    ${LOGIN_PAGE_SUBMIT_BUTTON}     context_name=Odeslat Prihlaseni

Zkontrolovat Vyplneni Prihlasovaciho Jmena
    [Documentation]    Zkontroluje, ze pole pro prihlasovaci jmeno obsahuje ocekavany text
    [Arguments]    ${expected_username}
    ${actual_username}=    Get Element Text    ${LOGIN_PAGE_USERNAME_INPUT}    context_name=Zkontrolovat Vyplneni Prihlasovaciho Jmena
    Should Be Equal As Strings    ${actual_username}    ${expected_username}    msg=Prihlasovaci jmeno nebylo vyplneno spravne. Ocekavano: '${expected_username}', Aktualni: '${actual_username}'

Zkontrolovat Vyplneni Hesla
    [Documentation]    Zkontroluje, ze pole pro heslo obsahuje ocekavany text
    [Arguments]    ${expected_password}
    ${actual_password}=    Get Element Text    ${LOGIN_PAGE_PASSWORD_INPUT}    context_name=Zkontrolovat Vyplneni Hesla
    Should Be Equal As Strings    ${actual_password}    ${expected_password}    msg=Heslo nebylo vyplneno spravne. Ocekavano: '${expected_password}', Aktualni: '${actual_password}'

Zkontrolovat Pritomnost Login Page
    [Documentation]    Zkontroluje, že se nacházím na Login stránce 
    Wait Element Ready   ${LOGIN_PAGE_WELCOME_TEXT}