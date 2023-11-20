*** Settings ***
Documentation       Swite de exemplo


*** Variables ***
${MENSAGEM}     Hello Word

*** Test Cases ***
Cenario de Teste 01: Ola Mundo!
    Imprimir Mensagem no console

*** Keywords ***
Imprimir Mensagem no console
    Log To Console  ${MENSAGEM}
