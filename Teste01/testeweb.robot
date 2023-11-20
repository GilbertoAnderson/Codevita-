*** Settings ****
Documentation   Swite Exemplo webTesting
Resource    resource.robot

*** Test Cases  ***
Caso Teste 01: Pesquisar produto no Site
    Acessar pagina home do site da loja
    Digitar o produto "blouse" na pesquisa
    Clicar no botao Pesquisar
    #Conferir se o produto "blouse" é exibido corretamente
    Fechar Navegador



