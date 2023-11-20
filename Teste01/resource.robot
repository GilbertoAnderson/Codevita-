*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${URL}      http://automationpractice.com/index.php


*** Keywords  ***
Acessar pagina home do site da loja
    Open Browser    url=${URL}  browser=${BROWSER}

Digitar o produto "${PRODUTO}" na pesquisa
    Input Text  id=search_query_top    ${PRODUTO}

Clicar no botao Pesquisar
    Click Button   name=submit_search

#Conferir se o produto "${PRODUTO}" é exibido corretamente

Fechar Navegador
    Close Browser

