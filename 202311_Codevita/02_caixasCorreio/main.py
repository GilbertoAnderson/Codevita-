# Codevita 2023
# Caixas no correio
# Gilberto Anderson
# ..............................................................................

# ......................... definir variaveis
qtd_cx = int()
pos_cx = int()

#.......................... funcoes


# ......................... coletar e validar entradas
while True:    
    entrada = input("digite a qtde de caixas e a posição desejada: ").split(",")

    #................ verifica se a qtde de entradas está correta
    s_int = True
    if len(entrada) != 2:
        print( " A qtde de informações fornecidas está incorreta ! ")
        s_int = False
    else:
        
        if int(entrada[0]):            
            qtd_cx = entrada[0]
            if qtd_cx < 2:
                print (" A quantidade de caixas deve estar entre 2 e 10 ")

            if qtd_cx > 10:
                print (" A quantidade de pontos deve estar entre 2 e 10 ")
        else:
            s_float = False        
            print ("A qtde de caixas precisa ser um numero inteiro, o valor informado = {} ".format(entrada[0]))
        

        try:
            int(entrada[0])
        except ValueError:
            s_float = False        
            print ("A qtde de caixas precisa ser um numero inteiro, o valor informado = {} ".format(entrada[0]))
        
        if qtde_posicoes < 2:
            print (" A quantidade de pontos deve estar entre 2 e 10 ")
        elif qtde_posicoes > 10:
            print (" A quantidade de pontos deve estar entre 2 e 10 ")
        else:
            break



        try:
            int(entrada[1])
        except ValueError:
            s_float = False        
            print ("A posição da caixas precisa ser um numero inteiro, o valor informado = {} ".format(entrada[1]))

    if s_int == True:  
        qtd_cx = entrada[0]
        pos_cx = entrada[1]
        break


    #................ verifica se os valores digitados podem ser convertidos em float

    x = 0
    while x < (len(coordenadas)-1):
        #print('passou aqui {}'.format(coordenadas[x]))
        try:
            float(x)
        except ValueError:
            s_float = False        
            print ("o valor de entrada {} não pode ser convertido em decimal".format(coordenadas[x]))
        x+= 1
        
    if s_float == True:
        # ......... transforma os dados da lista em float
        coordenadas = [float(i) for i in coordenadas]
        break

# ......................... coleta qtde caixa e posição




# ......................... identificar as posições atuais x desejadas
# ......................... posicionar a mais pesada
# ......................... posicionar as caixas em posição incorreta
# ......................... mostrar resultado



