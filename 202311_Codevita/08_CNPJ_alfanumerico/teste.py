import glob
import os

qtde_analisada = int(0)
qtde_encontrada = int(0)
lst_arquivos = []

key = input("Digite a palavra aqui => ")

os.chdir('C://Users/giba_/OneDrive/Documents/GitHub/Codevita-/202311_Codevita/08_CNPJ_alfanumerico/Arquivos')
for filename in glob.glob('*.sql'):
    #print("Verificando o arquivo",filename,"...")
    qtde_analisada = qtde_analisada + 1
    file = open(filename)
    if key in file.read():
        qtde_encontrada = qtde_encontrada + 1
        lst_arquivos.append(filename)
    file.close()

print('  ')
print('- '*30)
print('Resultado')
print('- '*30)
print("Analisamos {} arquivos.".format(qtde_analisada))
print("{} arquivos contém a palavra '{}'".format(qtde_encontrada,key))
print('.'*60)
print('Estes são os arquivos')
print('.'*60)
for n in lst_arquivos:
    print(n )

print('.'*60)
print(' ')
print(' ')