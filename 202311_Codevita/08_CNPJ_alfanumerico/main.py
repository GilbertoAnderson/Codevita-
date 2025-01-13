# Codevita 2023
# CNPJ alfanumerico
# Gilberto Anderson
# ..............................................................................
import math
import time

# define variaveis
print_log = False

str_cnpj = ''



# ................................................ calculo modulo 11
def mod11(lista):
    
    #print ("len lista  {}!".format(len(lista)))

    li_multi = int(5)
    if len(lista) == 12:
        li_multi= int(6)

    #print ("lista  {}!".format(lista)) 
    nova_num =  [int(valor) for valor in lista]
    nova_lista = []

    #....................................... tualiza a lista com o multiplicador
    for n in nova_num:
        valor = n * li_multi
        nova_lista.append(valor)

        li_multi = li_multi + 1
        if li_multi == 10:
           li_multi = 2



    #print ("nova_lista  {}!".format(nova_lista)) 

    somatoria = sum(nova_lista)
    #print ("somatoria  {}!".format(somatoria)) 

    produto = somatoria / 11
    #print ("produto  {}!".format(produto))

    produto_int = int(produto)
    #print ("produto_int  {}!".format(produto_int)) 

    resto = somatoria - (produto_int*11)
    #print ("resto  {}!".format(resto)) 


    return resto

# ................................................ calculo para mesma face
def converte_alfa_num(str_cnpj):  
    str_atual = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3','4','5','6','7','8','9','0']
    str_novo  = ['17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','1','2','3','4','5','6','7','8','9','0']
    str_cnpj = str_cnpj.upper()
    novo_cnpj = ''
    pos = int(0)

    if print_log == True:
        print ("cnpj  {} ".format(str_cnpj))  

    # ........................................... procura cada caracter do cnpj
    for n in range(0 ,(len(str_cnpj))):
        
        letra = str_cnpj[n:n+1]
        #print('----------------')
        #print(n)
        #print ("letra no cnpj  {}!".format(letra))  

        for c in str_atual:

            #print ("letra do str_atual  {}!".format(c)) 
            if letra == c: 
                pos = str_atual.index(c)
                #print ("letra do str_atual  {}!".format(c)) 
                #print ("posicao da letra do str_atual  {}!".format(pos))  
                break


        nova_letra = str_novo[pos] 

        if n < 11:
            nova_letra = nova_letra + ',' 

        #print ("nova  letra  {}!".format(nova_letra)) 

        novo_cnpj = novo_cnpj + nova_letra


    if print_log == True:
        print(novo_cnpj)

    return novo_cnpj


# -------------------------------------------------------------------------
#  core do programa
# -------------------------------------------------------------------------
#  
# ......................................... inicio da coleta de dados
while True:
    
    s_ok= True
    str_cnpj_in = input("digite o CNPJ neste formato (AA.AAA.AAA/AAAA-NN): ")
    str_cnpj = str_cnpj_in
    #print(len(str_cnpj)) 

    if len(str_cnpj) != 18 :
        print ("Por favor, digite o CNPJ no formato solicitado.")        
        s_ok= False

    if s_ok == True:
        break


while True:
    #................................................................ processa os pontos
    tempo_inicial = time.time()
    n = 0

    # ....................................... remove caracteres especiais
    for c in ".!?,#@&%/-":
        str_cnpj = str_cnpj.replace(c, '')

    #........................................ remove o 2 digitos verificadores
    novo_str_cnpj = str_cnpj[0:12]
    #print ("str_cnpj {}!".format(str_cnpj)) 
    #print ("novo_str_cnpj {}!".format(novo_str_cnpj)) 

    #........................................ de para caracteres alfanumerico
    depara_cnpj = converte_alfa_num(novo_str_cnpj)
    #print ("depara_cnpj {}!".format(depara_cnpj)) 
    
    #........................................ cria uma lista com o retorno convertido
    lst_cnpj = depara_cnpj.split(',')
    #print ("lst_cnpj {}!".format(lst_cnpj)) 

    #........................................  busca primeiro digito verificador
    primeiro_digito = mod11(lst_cnpj)
    #print ("primeiro_digito {}!".format(primeiro_digito)) 
    
    #........................................  adiciona o primeiro digito na lista
    lst_cnpj.append(str(primeiro_digito))
    #print ("lst_cnpj ** {}!".format(lst_cnpj)) 

    
    #........................................  separador no log para identificar o processamento do segundo digito
    #print('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ')

    #........................................  busca segundo digito verificador
    segundodigito =  mod11(lst_cnpj)
    #print ("segundodigito  {}!".format(segundodigito)) 
    
    #........................................  adiciona os digitos no cnpj
    novo_str_cnpj = novo_str_cnpj + str(primeiro_digito) + str(segundodigito)
    #print("O CNPJ correto seria {}".format(novo_str_cnpj))

    #........................................ format o novo cnpj
    novo_str_cnpj = novo_str_cnpj[0:2]+'.'+novo_str_cnpj[2:5]+'.'+novo_str_cnpj[5:8]+'/'+novo_str_cnpj[8:12]+'-'+novo_str_cnpj[12:14]


    # ....................................... mostra o resultado
    print('  ')
    print('- '*30)
    print('Resultado')
    print('- '*30)
    print("O CNPJ informado foi {}".format(str_cnpj_in))
    print("O CNPJ correto seria {}".format(novo_str_cnpj))
    if str_cnpj_in == novo_str_cnpj:
        print('CNPJ digitado está correto')
    else:
        print('corrija o CNPJ digitado')

    print('processamento   %s segundos' % (time.time() - tempo_inicial))  
    print('- '*30)
    print('  ')

    break





    






