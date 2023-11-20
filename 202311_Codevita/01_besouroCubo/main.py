# Codevita 2023
# Besouro e o Cubo
# Gilberto Anderson
# ..............................................................................
import math
# define variaveis
xi = float(0)
yi = float(0)
zi = float(0)
xf = float(0)
yf = float(0)
zf = float(0)
distancia = float(0)
dist_total = float(0)



# define as funcoes
def verifica_face(xi, yi, zi, xf, yf, zf):
    mesma_face = True
    coordenadas_iguais = 0
    if xi == xf:
        coordenadas_iguais = coordenadas_iguais + 1
    if yi == yf:
        coordenadas_iguais = coordenadas_iguais + 1
    if zi == zf:
        coordenadas_iguais = coordenadas_iguais + 1
    if coordenadas_iguais < 2:
        mesma_face = False
    return mesma_face

def calc_mesmaFace(xi, yi, zi, xf, yf, zf):  
    raio = float(0)
    if xi != xf:
        raio = xf - xi
    if yi != yf:
        raio = yf - yi
    if zi != zf:
        raio = zf - zi
    arco = float( 2 * raio * 3.141516)/6 
    return arco

def calc_outraFace(xi, yi, zi, xf, yf, zf): 
    
    distancia_x = float(0)
    distancia_y = float(0)
    distancia_z = float(0)

    if xi < xf:
        distancia_x = xf - xi
    else:
        distancia_x = xi - xf

    if yi < yf:
        distancia_y = yf - yi
    else:
        distancia_y = yi - yf        
        
    if zi < zf:
        distancia_z = zf - zi
    else:
        distancia_z = zi - zf

    distancia_outraface = float(distancia_x + distancia_y + distancia_z)
    return distancia_outraface
   

# recebe a quantidade de pontos
while True:
    qtde_posicoes = int(input("digite a quantidade de pontos: "))
    if qtde_posicoes < 2:
        print (" A quantidade de pontos deve estar entre 2 e 10 ")
    elif qtde_posicoes > 10:
        print (" A quantidade de pontos deve estar entre 2 e 10 ")
    else:
        break

# recebe as coordenadas x,y,z para cada ponto
while True:    
    coordenadas = input("digite as coordenadas: ").split(",")

    #................ verifica se a qtde de entradas está correta
    s_float= True
    if (len(coordenadas) % qtde_posicoes)> 0:
        print( " A qtde de coordenadas para {} pontos precisar ser {} , e está com {} ".format(qtde_posicoes, qtde_posicoes*3, len(coordenadas)))
        s_float= False


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



#..... processa os pontos
n = 0

while n < (len(coordenadas)-3):
    #........... popula ponto inicial
    xi = round(coordenadas[n + 0],2)
    yi = round(coordenadas[n + 1],2)
    zi = round(coordenadas[n + 2],2)
    #........... popula ponto final    
    xf = round(coordenadas[n + 3],2)
    yf = round(coordenadas[n + 4],2)
    zf = round(coordenadas[n + 5],2)

    # .......... identifica se esta na mesma face
    mesmaFace = verifica_face(xi, yi, zi, xf, yf, zf)
    if mesmaFace == True:
        distancia = calc_mesmaFace(xi, yi, zi, xf, yf, zf)
    else:
        distancia = calc_outraFace(xi, yi, zi, xf, yf, zf)

    #print(distancia)
    dist_total +=  round(distancia,2) 

    n+= 3

print("a distância total é de {}".format(dist_total))





    






