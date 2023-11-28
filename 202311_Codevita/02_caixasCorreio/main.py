# Codevita 2023
# Caixas no correio
# Gilberto Anderson
# ..............................................................................
import time

# ......................... definir variaveis
qtd_cx = int()
pos_cx = int()

#.......................... funcoes


# ......................... coletar e validar qtde de caixas e posição da caixa mais pesada
while True:    
    entrada = input("digite a qtde de caixas e a posição desejada separadas por virgula: ").split(",")

    #................ verifica se a qtde de entradas está correta
    s_int = True
    if len(entrada) != 2:
        print( " A qtde de informações fornecidas está incorreta, você deve informar qtde de caixas,  posição do escritório ! ")
        s_int = False
    else:
        #........................ valida a qtde de caixas
        try:
            int(entrada[0])            
        except ValueError:
            s_int = False    
            print ("A qtde de caixas precisa ser um numero inteiro, o valor informado = {} ".format(entrada[0]))
        
        if s_int == True:
            qtd_cx = int(entrada[0])  

            if qtd_cx <= 1:
                s_int = False
                print (" A quantidade de caixas deve estar entre 2 e 50 ")

            if qtd_cx >= 51:
                s_int = False
                print (" A quantidade de pontos deve estar entre 2 e 50 ")
        

        # ....................... valida a posicao da caixa mais pesada
        try:
            int(entrada[1])
        except ValueError:
            s_int = False    
            print (" A posição da caixa mais pesada precisa ser um numero inteiro, o valor informado = {} ".format(entrada[1]))
        
        if s_int == True:
            pos_cx = int(entrada[1])
            if pos_cx <= 0:
                s_int = False
                print (" A posição da caixa mais pesada deve estar entre 1 e {} ".format(entrada[0]))

            if pos_cx >= (qtd_cx + 1):
                s_int = False
                print (" A posição da caixa mais pesada deve estar entre 1 e {} ".format(entrada[0]))
            
    # ................se deu tudo certo vai buscar a segunda linha       
    if s_int == True:  
        break  

# ......................... coletar e validar o peso de cada caixa
while True:    
    pesos = input("digite o peso de cada caixa separado por virgula: ").split(",")

    #................ verifica se a qtde de entradas está correta
    s_int = True
    if len(pesos) != qtd_cx:
        print( " A qtde de pesos dever igual a qtde de caixas! ")
        s_int = False
    else:
        #............ verifica se cada peso é um float
        x = 0
        soma = float(0)
        while x < (len(pesos)-1):
            try:
                float(pesos[x])
            except ValueError:
                s_int = False        
                print ("o valor do peso {} não pode ser convertido em decimal".format(pesos[x]))
                break
            #.......... totaliza o peso das cixas
            soma += float(pesos[x])
            x+= 1
        
        if soma > 1000:
            s_int = False   
            print ("O peso total das caixas é de {} kg, ultrapassou o limite de 1.000 kg".format(soma))  


    if s_int == True:
        # ......... transforma os dados da lista em float
        pesos = [float(i) for i in pesos]
        break


# ......................... coleta qtde caixa e posição
print(entrada)
print(pesos)

tempo_inicial = time.time()




# ......................... identificar as posições atuais x desejadas
# ......................... posicionar a mais pesada
# ......................... posicionar as caixas em posição incorreta
# ......................... mostrar resultado

print('  ')
print('assento inicial {}'.format(primeiroAssentoInicial))
print('assento final.. {}'.format(ultimoAssentoInicial))
print('distancia ..... {}'.format(distanciaAssentos))  
print('processamento   %s segundos' % (time.time() - tempo_inicial))  
print('  ')



