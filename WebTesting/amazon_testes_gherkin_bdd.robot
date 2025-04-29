*** Settings ***
Documentation    Essa suite teste o site da amazon.com.Busca_produtos
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador



*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
        [Documentation]    Esse teste verifica o menu Eletrônicos do site da amazon.com.br
        ...                e everifica a categoria Computadores e Informática  
        [Tags]             menus    categorias
        Dado que estou na home page da Amazon.com.br
        Quando acessar o menu "Eletrônicos"
        Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
        E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
        E a categoria "Computadores e Informática" deve ser exibida na página
    
        
 Caso de Teste 02 - Pesquisa de um produto
        [Documentation]    Esse teste verifica a busca de um produto
        [Tags]             Busca_produtos    lista_busca
        Dado que estou na home page da Amazon.com.br
        Quando pesquisar pelo produto "Xbox Series S"
        Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
        E um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
        [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
        [Tags]             adicionar_carrinho
        Dado que estou na home page da Amazon.com.br
        Quando pesquisar pelo produto "Xbox Series S"
        Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
        E um produto da linha "Xbox Series S" deve ser mostrado na página
        E Adiciono o produto no carrinho 
        E Verifico se o produto foi adicionado no carrinho





Caso de Teste 04 - Remover Produto do Carrinho
        [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
        [Tags]             remover_carrinho
        Dado que estou na home page da Amazon.com.br
        Quando pesquisar pelo produto "Xbox Series S"
        Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
        E um produto da linha "Xbox Series S" deve ser mostrado na página
        E Adiciono o produto no carrinho 
        E Verifico se o produto foi adicionado no carrinho
        E Removo o produto do carrinho
        E Verifico se o produto foi removido