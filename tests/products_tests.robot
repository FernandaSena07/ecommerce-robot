*** Settings ***
Documentation     Testes de navegação e produtos no Sauce Demo
Resource          ../resources/locators.robot
Resource          ../resources/keywords.robot
Library           SeleniumLibrary
Library           Collections


*** Test Cases ***
Verificar lista de produtos
    Open Products Page
    Page Should Contain Element    ${PRODUCT_LIST}
    ${names}    ${prices}    ${images}=    Get Product Details
    Log    Nomes dos produtos: ${names}
    Log    Preços dos produtos: ${prices}
    ${num_images}=    Get Length    ${images}
    Log    Número de imagens: ${num_images}
    Close Browser
    

Testar filtragem de produtos (Price low to high)
    Open Products Page
    Apply Product Filter    lohi
    ${names}    ${prices}    ${images}=    Get Product Details
    Log    Preços ordenados do menor para o maior: ${prices}
    Close Browser
