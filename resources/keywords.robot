*** Settings ***
Resource    ./locators.robot
Library     SeleniumLibrary
Library     Collections
Library    OperatingSystem

*** Keywords ***
# --- Login ---
Open Browser To Login Page
    [Documentation]    Abre o Chrome e vai para a página de login
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --disable-password-manager-reauthentication
    Call Method    ${options}    add_argument    --disable-save-password-bubble
    Open Browser    ${URL}    chrome    options=${options}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    timeout=10s

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}
    Click Button  ${LOGIN_BUTTON}

# --- Produtos ---
Open Products Page
    Open Browser To Login Page
    Login With Credentials    standard_user    secret_sauce
    Wait Until Element Is Visible    ${PRODUCT_LIST}    timeout=10s

Get Product Details
    @{names}=    Create List
    @{prices}=   Create List
    @{images}=   Get WebElements    ${PRODUCT_IMAGE}

    FOR    ${el}    IN    @{names}
        ${text}=    Get Text    ${el}
        Append To List    ${names}    ${text}
    END
    FOR    ${el}    IN    @{prices}
        ${text}=    Get Text    ${el}
        Append To List    ${prices}    ${text}
    END

    RETURN    ${names}    ${prices}    ${images}

Apply Product Filter
    [Arguments]    ${filter_option}
    Select From List By Value    ${FILTER_DROPDOWN}    ${filter_option}
    Sleep    1s


