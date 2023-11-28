
S = 100  # qtde de assentos
M = 6    # qtde de blocos
assentosBloco=(3,10,30,5,30,22)
tipo_assento = []  # lista de assentos que vai identificar seco ou molhado

tipo = 0 # 0 seco 1 molhado
x = 0
last = 0 # ultimo assento deste bloco
print(last)
print('qtde de blocos:{}'.format(len(assentosBloco)))
print('---------------------------')
for n in assentosBloco:  
    print(n)
    last += n
    while x < last:
        tipo_assento.append(tipo)
        x += 1
        
    if tipo == 0:
        tipo = 1
    else:
        tipo = 0


print(tipo_assento) 



    for l in (range lin_inicial, rl):
        for c in(range col_inicial,rc):
            ls_valor = matriz[lin][c]
            # .......................... se for obstaculo 
            if ls_valor in ('S','L','W','T'):
                obstaculos += ls_valor
            
            # .......................... se for destino 
            if ls_valor in ('D'):
                destino = 'DESTINATION'
                
            # .......................... se for rota altera dados 
            if ls_valor in ('R'):
                lin_inicial = l
                col_atual = c

     

        
  print('- '*30)
    print(destino)
    # ordenar resultado
    obstaculos = sorted(ls_valor)
    print(obstaculos)
    # inserir na lista
    resposta.append(obstaculos)
    print(resposta)
    
    # se destino != '' inserir na lista e sair do for
    if destino != '':
        break