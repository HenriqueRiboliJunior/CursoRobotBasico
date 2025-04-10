*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}                                 https://www.amazon.com.br/
${MENU_ELETRONICOS}                    //a[normalize-space()='Eletrônicos']
${HEADER_ELETRONICOS_E_TECNOLOGIA}     (//span[contains(text(),'Eletrônicos e Tecnologia')])[1]
${TEXTO_HEADER_ELETRONICOS}            Eletrônicos e Tecnologia   

*** Keywords ***
Abrir o navegador
    Open Browser               https://www.amazon.com.br/ref=nav_bb_logo    firefox  
    Maximize Browser Window

Fechar o navegador 
    Close Browser         


Acessar a home page do site Amazon.com.br
    Go To                            ${URL}
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Link    ${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains         ${TEXTO_HEADER_ELETRONICOS}    
    Wait Until Element Is Visible    ${HEADER_ELETRONICOS_E_TECNOLOGIA}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    ${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible   //span[@class='a-size-base-plus'][normalize-space()='${NOME_CATEGORIA}']