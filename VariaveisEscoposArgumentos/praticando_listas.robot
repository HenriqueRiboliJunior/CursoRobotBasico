***Settings***
Documentation   Exemplo de tipos de variáveis: SIMPLES, LISTAS e DICIONÁRIOS
***Variables***
&{MESES}    Janeiro=30    
...         Fevereiro=28    
...         Marco=31

*** Test Cases ***
Adicionando variavel Global
    Set Global Variable    ${MESES}

Imprimindo os meses 
    Log To Console    Janeiro: ${MESES.Janeiro}
    Log To Console    Fevereiro: ${MESES.Fevereiro}
    Log To Console    Marco: ${MESES.Marco}

    

