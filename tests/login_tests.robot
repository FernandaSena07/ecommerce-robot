*** Settings ***
Documentation     Testes de login no Sauce Demo
Resource          ../resources/locators.robot
Resource          ../resources/keywords.robot
Library           SeleniumLibrary

*** Test Cases ***
Login - Usuário válido
    Open Browser To Login Page
    Login With Credentials    standard_user    secret_sauce
    Wait Until Element Is Visible    ${PRODUCT_LIST}    timeout=5s
    Page Should Contain Element    ${PRODUCT_LIST}
    Close Browser

Login - Senha inválida
    Open Browser To Login Page
    Login With Credentials    standard_user    wrong_password
    Wait Until Element Is Visible    ${ERROR_MSG}    timeout=5s
    Element Should Contain    ${ERROR_MSG}    Epic sadface
    Close Browser

