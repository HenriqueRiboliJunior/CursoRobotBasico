*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}                                 https://www.amazon.com.br/
${MENU_ELETRONICOS}                    //a[normalize-space()='Eletrônicos']
${HEADER_ELETRONICOS_E_TECNOLOGIA}     (//span[contains(text(),'Eletrônicos e Tecnologia')])[1]
${TEXTO_HEADER_ELETRONICOS}            Eletrônicos e Tecnologia   
${CAMPO_PESQUISA}                      twotabsearchtextbox
${BOTAO_PESQUISA}                      nav-search-submit-button
${PRODUTO_XBOX}                        (//span[contains(text(),'Microsoft Xbox Series S 512 GB All-Digital Console')])[1]
${ADICIONAR_CARRINHO}                  add-to-cart-button
${GARANTIA_EXTENDIDA_NAO}              (//input[@aria-labelledby='attachSiNoCoverage-announce'])[1]
${TITULO_GARANTIA_EXTENDIDA}           (//span[@id='attach-warranty-displayTitle'])[1]
${ADICIONADO_AO_CARRINHO}              //h1[normalize-space()='Adicionado ao carrinho']

*** Keywords ***
Abrir o navegador
    Open Browser               https://www.amazon.com.br/ref=nav_bb_logo    firefox  
    Maximize Browser Window

Fechar o navegador 
    Capture Page Screenshot
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

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    ${CAMPO_PESQUISA}    ${PRODUTO}

Clicar no botão de pesquisa
    Click Element    ${BOTAO_PESQUISA}

Verificar o resultado da pesquisa se está listando o produto ${PRODUTO}
    Wait Until Element Is Visible    //span[normalize-space()=${PRODUTO}]

Adicionar o produto "Console Xbox Series S" no carrinho
    Wait Until Element Is Visible   ${PRODUTO_XBOX}
    Click Element                   ${PRODUTO_XBOX} 
    Wait Until Element Is Visible   ${ADICIONAR_CARRINHO}
    Click Button                    ${ADICIONAR_CARRINHO}


Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible       ${ADICIONADO_AO_CARRINHO}
    Element Should Be Visible           ${ADICIONADO_AO_CARRINHO}

Remover o produto "Console Xbox Series S" do carrinho
    Click Link   //a[@href='/cart?ref_=sw_gtc']
    Wait Until Element Is Visible    a-icon a-icon-small-trash
    Click Button    a-icon a-icon-small-trash
Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    //span[@class='a-size-base sc-list-item-removed-msg-text-delete']
    Element Should Be Visible        //span[@class='a-size-base sc-list-item-removed-msg-text-delete']


#GHERKIN

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"
    
Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa


Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"


E Adiciono o produto no carrinho 
    Adicionar o produto "Console Xbox Series S" no carrinho
E Verifico se o produto foi adicionado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E Removo o produto do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

E Verifico se o produto foi removido
    Verificar se o carrinho fica vazio
