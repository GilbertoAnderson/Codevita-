# Codevita 2023
# Obstaculos
# Gilberto Anderson
# https://github.com/GilbertoAnderson/Codevita-/tree/main/202311_Codevita/07_obstaculos
# ..............................................................................
# restricoes
# 2 <= N <= 20
# tempo limite 1 seg
# ..............................................................................
import time


# .............................................................................. define variaveis
print_log = True
simulacao = True

# .............................................................................. funcoes
def gerar_matriz (n_linhas, n_colunas):
    matriz = []

    for _ in range(n_linhas):
        matriz.append( [" "] * n_colunas )

    return matriz

# .............................................................................. entradas 

# ................................ dimensao da matriz
N = int(0) # N - dimensao da matriz 
linha = int(0)
coluna = int(0)


if simulacao == False:
    while True:    
        entrada = input("digite a dimensão da matriz: ")

        #................ verifica se a qtde de entradas está correta
        s_int = True
        if len(entrada) >= 3:
            print( " A qtde de informações fornecidas está incorreta, você deve informar apenas um número inteiro! ")
            s_int = False
        else:
            #........................ valida a qtde de caixas
            try:
                int(entrada[0])            
            except ValueError:
                s_int = False    
                print ("A matriz precisa ser um numero inteiro, o valor informado = {} ".format(entrada))

        # ................................ restricoes
        # N <= 2   nao pode ser menor ou igual a 2 
        # N >= 20  nao pode ser superior a 20
        
        if s_int == True:
            N = int(entrada)  

            if N <= 2:
                s_int = False
                print (" A quantidade de caixas deve estar entre 2 e 20 ")

            if N >= 21:
                s_int = False
                print (" A quantidade de pontos deve estar entre 2 e 20 ")
        
        if s_int == True:  
            break

# ................... desbloquear para simulacao
if simulacao == True:
    N = 4

# ................................ valores de cada matriz
# A - inicio
# D - destino
# S - Pedra denotada   obstaculo
# L - Parede indicada  obstaculo
# W - Agua indicada    obstaculo
# T - Espinho          obstaculo
# M - Musica           nao obstaculo
# R - Rota             caminho a seguir


matriz = gerar_matriz(N,N)

if simulacao == False:
    linha = 0
    while linha < N:

        while True:
            entrada = input('digite os {} valores da linha {} separados por espaco: '.format(N,linha)).split(" ")

            s_check = True
            if len(entrada) != N:
                print( " A qtde de informações precisar ser {} e está com {} ".format(N, len(entrada)))
                s_check = False

            coluna = 0 
            while coluna < N:
                ls_valor = entrada[coluna].upper()

                if ls_valor in ('A','D','R','M','S','L','W','T'):
                    matriz[linha][coluna] = ls_valor
                else:    
                    s_check = False
                    print( " o valor digitado  {} deve estra entre estes 'A','D','R','M','S','L','W','T' ".format(ls_valor))

                coluna += 1

            if s_check == True:  
                break  
        
        linha += 1  
       

# ................... simulacao

if simulacao == True:
    matriz[0][0] = 'A'
    matriz[0][1] = 'S'
    matriz[0][2] = 'L' 
    matriz[0][3] = 'D'

    matriz[1][0] = 'T'
    matriz[1][1] = 'R'
    matriz[1][2] = 'W'
    matriz[1][3] = 'R'

    matriz[2][0] = 'R'
    matriz[2][1] = 'M'
    matriz[2][2] = 'S'
    matriz[2][3] = 'R'

    matriz[3][0] = 'W'
    matriz[3][1] = 'R'
    matriz[3][2] = 'R'
    matriz[3][3] = 'M'


# ................... print log
#if print_log == True: 
print()
print('-' * 50)
print('MATRIZ')
print('-' * 50)
for linha in range(0,N):        
    for coluna in range(0,N):
        print(f'[{matriz[linha][coluna]:^3}]',end='')
    print()
print()


# .............................................................................. processamento
tempo_inicial = time.time()

lin_atual   = int(0)
col_atual   = int(0)
lin_inicial = int(0)
col_inicial = int(0)
lin_ant     = int(0)
col_ant     = int(0)

resposta = []
destino  = ''
saida    = True
x = 1
while destino == '': # executa ate encontrar destino
    
    if print_log == True:
        print('rodada..... {}'.format(x))
        print('Atual... {}, {}'.format(lin_atual,col_atual))
        x += 1

    # identifica que ainda nao achou o proximo ponto
    achou_proximo = False
    obstaculos = []

    # delimitando a linha
    lin_inicial = lin_atual - 1
    lin_final   = lin_atual + 1
    if lin_atual == 0:
        lin_inicial = lin_atual 
    elif lin_atual == (N-1):
        lin_final = N-1

    # delimitando a coluna
    col_inicial = col_atual - 1
    col_final   = col_atual + 1
    if col_atual == 0:
        col_inicial = col_atual 
    elif col_atual == (N-1):
        col_final = N-1
        
    if print_log == True:
        print('Inicial. {}, {}'.format(lin_inicial,col_inicial))
        print('Final... {}, {}'.format(lin_final,col_final))

    linha  = lin_inicial
    coluna = col_inicial
    
    
    if print_log == True:
        print('Anterior {}, {}'.format(lin_ant,col_ant))
        print('-'*10)

    while linha <= lin_final: 
        while coluna <= col_final:   

            ls_valor = matriz[linha][coluna]
            
            if print_log == True:
                print('{}, {}: {}'.format(linha, coluna, ls_valor))

            if ls_valor in ('S','L','W','T'):
                obstaculos += ls_valor 
            
            # .......................... se for destino 
            if ls_valor in ('D'):
                destino = 'DESTINATION'
                
            # .......................... se for rota altera dados 
            if ls_valor == 'R' and achou_proximo == False:
                if lin_atual != linha or col_atual != coluna:
                    if lin_ant != linha or col_ant != coluna:
                        lin_ant = lin_atual
                        col_ant = col_atual
                        lin_atual = linha 
                        col_atual = coluna
                        achou_proximo = True
            # ............... proxima coluna           
            coluna += 1
        #.................... proxima linha
        linha += 1
        coluna = col_inicial

    if saida == False: # nao popular quando for ponto inicial
        # ordena os dados
        obstaculos = sorted(obstaculos)
        # inserir na lista
        resposta.append(obstaculos)


    saida = False
    
  
 


# .............................................................................. saidas
print('-'*50)
print('Resultado')
print('-'*50)
for linha in (resposta):   
    for coluna in linha:
        print(coluna, end=' ')
    print()
print(destino)
print('-'*50)
print('processamento   %s segundos' % (time.time() - tempo_inicial))  
print('-'*50)
