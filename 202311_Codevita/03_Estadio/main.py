# Codevita 2023
# Estadio
# Gilberto Anderson
# ..............................................................................
# restricoes
# S,N,K < 1000
# M < 30
# tempo limite 1 seg
# ..............................................................................
import math
import time


# define variaveis
print_log = False

# entradas 
S = int(0) # S - assentos reservados
N = int(0) # N - contingente
k = int(0) # k - dispostos a sentar no molhado
M = int(0) # M - qtde de blocos de assentos

tipoAssento = int(0)            # tipo do assento seco ou molhado
assentoDesocupado = int(0)      # qtde de assentos desocupados na fila
assentoSeco = int(0)            # qtde de assentos secos na fila
assentoMolhado = int(0)         # qtde de assentos molhados na fila
limiteDesocupado = int(15)      # qtde maxima de assento desocupado
assentoInicial = int(0)         # numero do assento que iniciou a fila 
assentoFinal = int(0)           # numero do assento que finalizou a fila

primeiroAssentoInicial = int(0) # primeiro assento que iniciou a fila
ultimoAssentoInicial = int(0)   # primeiro assento que iniciou a fila
distanciaAssentos = int(0)      # qtde de assentos na fila
distanciaTemp = int(0)          # qtde de assentos na fila valor temporariopython

# processo inicia a fila no primeiro assento
# caso todas restrições sejam aceitas calcular a distancia e gravar em distanciaTemp
# caso distanciaAssentos = 0 ou menor que distanciaTemp, substituir o valor de 
# distanciaAssentos pelo valor de distanciaTemp


# recebe as coordenadas S,N,K,M para cada ponto
while True:    
    entrada = input("digite assentos reservados, contingente, qtde que sentam no molhado, qtde de blocos: ").split(",")
    #entrada = (100,50,5,6)
    #................ verifica se a qtde de entradas está correta
    s_int= True
    if len(entrada) != 4:
        print( " A qtde de informações precisar ser 4  e está com {} ".format(len(entrada)))
        s_int = False

    #................ verifica se aS entradas podem ser convertidas em inteiro
    if s_int == True:
        x = 0
        while x < 4:
            try:
                int(entrada[x])
            except ValueError:
                s_int = False        
                print ("o valor de entrada {} não pode ser convertido em inteiro".format(entrada[x]))
            x+= 1
    # ................ valida as restricoes
    # S,N,K < 1000
    # M < 30
    if s_int == True:    
        S = int(entrada[0])
        N = int(entrada[1])
        k = int(entrada[2])
        M = int(entrada[3]) 
        if S >= 1000 :
            s_int = False        
            print ("o limite de assentos reservados é menor que 1000 e está com {}!".format(S))
        
        if N >= 1000 :
            s_int = False        
            print ("o limite de contigente é menor que 1000 e está com {}!".format(N))

        if k >= 1000 :
            s_int = False        
            print ("o limite de assentos molhados possíveis é menor que 1000 e está com {}!".format(k))

        if M >= 30 :
            s_int = False        
            print ("o limite de blocos é menor que 30 e está com {}!".format(M))    


    #................ popula as variaveis e segue para a proxima entrada de dados
    if s_int == True:
        break



# recebe o numero de assentos para cada bloco
while True:    
    assentosBloco = input("digite a qtde assentos por bloco: ").split(",")
    # assentosBloco = (3,10,30,5,30,22)
    #................ verifica se a qtde de entradas está correta
    s_int = True
    if len(assentosBloco) != M:
        print( " A qtde prevista de blocos é de {} e está com {} ".format(M,len(assentosBloco)))
        s_int = False
        
    #x = 0
    #while x < M:
    #    print(assentosBloco[x])
    #    x+= 1

    #................ verifica se as entradas podem ser convertidas em inteiro
    if s_int == True:
        x = 0
        while x < M:
            try:
                int(assentosBloco[x])
            except ValueError:
                s_int = False        
                print ("O valor {} da fila {} não pode ser convertido em inteiro".format(assentosBloco[x], x))
            x+= 1

    # ............... valida a quantidade de assentos é igual a informada
    if s_int == True:
        assentosBloco = [int(i) for i in assentosBloco]    
        if sum(assentosBloco) != S:
            s_int = False        
            print ("A soma dos assentos ({}) é maior que quantidade assentos ({}) informada inicialmente!".format(sum(assentosBloco), S))            


    #................ popula as variaveis e segue para a proxima entrada de dados
    if s_int == True:
        break

# ...................  lista de assentos que vai identificar seco ou molhado

if print_log == True:
    print('')
    print('Dados de entrada')

    print('S - assentos reservados ......... = {}'.format(S))
    print('N - contingente ................. = {}'.format(N)) 
    print('k - dispostos a sentar no molhado = {}'.format(k))
    print('M - qtde de blocos de assentos .. = {}'.format(M)) 
    print('qtde de assentos por ordem ...... = {}'.format(assentosBloco))
    print('inicio do processamento')

tempo_inicial = time.time()

tipo_assento = []  # lista de assentos que vai identificar seco ou molhado
tipo = 0 # 0 seco 1 molhado
x = 0
last = 0 # ultimo assento deste bloco
for n in assentosBloco: 
    last += n     # last vai ser igual a cada valor de assentosBloco
    while x < last:
        tipo_assento.append(tipo)
        x += 1
        
    if tipo == 0:
        tipo = 1
    else:
        tipo = 0

# ............ imprime ordem dos bancos secos ou molhados

if print_log == True:
    print('')
    print('lista do a secos e molhado')
    x = 0
    status  = ''
    for n in tipo_assento:
        x += 1
        if n == 0:
            status = 'seco'
        else:
            status = 'molhado'

        print('assento {} = {}'.format(x,status))

# ....................... gera possiveis listas e mantem a menor
maxAssentoInicial = S - N  # assentos reservados - contingente
distanciaAssentos = S
assentoInicial = 1

if print_log == True:
    print('assentoInicial     {}'.format(assentoInicial))
    print('maxAssentoInicial  {}'.format(maxAssentoInicial))
    print('distancia assentos {}'.format(distanciaAssentos))


while assentoInicial <= maxAssentoInicial:
    #........... verifica o tipo de assento
    assentoDesocupado = 0   
    assentoSeco = 0
    assentoMolhado = 0

    distanciaTemp = (N - 1)  # define uma distancia minima contingente - 1
    restricao = True        # tira as restricoes 

    assentoAtual = assentoInicial
    x = 1  # contador 

    while x < distanciaTemp:      

        if tipo_assento[assentoAtual-1] == 0 : # assento seco
            assentoSeco += 1
        else:
            #............. verifica se passou do limite 
            if assentoMolhado < k:
                assentoMolhado += 1
            else:
                assentoDesocupado += 1
                distanciaTemp += 1  # ..... assento é desocupado aumenta a distancia

        if (assentoSeco + assentoMolhado) == N: # se atingiu o contigente finaliza
            break

        if assentoAtual >= S: # se for maior que os assentos reservados finaliza
            break


        x += 1             # acrescenta um assento
        assentoAtual += 1  # acrescenta o numero do assento
  
       
    
    assentoFinal =  assentoInicial + distanciaTemp

    # ............... se ultrapassar o limite de desocupado descartar        
    if assentoDesocupado > limiteDesocupado:
        #print('limite {}'.format(limiteDesocupado))
        restricao = False

    if assentoFinal > S:
        #print('assento final')
        restricao = False

    if restricao == True:
        if distanciaAssentos > distanciaTemp:
            primeiroAssentoInicial = assentoInicial 
            ultimoAssentoInicial = assentoFinal
            distanciaAssentos = distanciaTemp
            if print_log == True:
                print('outra menor distancia encontrada {}'.format(distanciaAssentos))


    if print_log == True:
        print('  ')
        print('assento inicial .. {}'.format(assentoInicial))
        print('assento final .... {}'.format(assentoFinal))
        print('assento seco ..... {}'.format(assentoSeco))
        print('assento molhado .. {}'.format(assentoMolhado))
        print('assento desocupado {}'.format(assentoDesocupado))
        print('distancia temp.... {}'.format(distanciaTemp))
        print('distancia assentos {}'.format(distanciaAssentos))
        print('restricao ........ {}'.format(restricao))

    assentoInicial += 1


print('  ')
print('- '*50)
print('R e s u l t a d o')
print('- '*50)
print('assento inicial {}'.format(primeiroAssentoInicial))
print('assento final.. {}'.format(ultimoAssentoInicial))
print('distancia ..... {}'.format(distanciaAssentos))  
print('processamento   %s segundos' % (time.time() - tempo_inicial))  
print('- '*50)
print('  ')




